import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/artikel.dart';
import '../services/auth_service.dart';

class DetailScreen extends StatefulWidget {
  final Article article;
  const DetailScreen({super.key, required this.article});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _isFavorite = false;
  bool _loading = true;

  String get _docId {
    final uid = AuthService.currentUser?.uid ?? 'guest';
    return '${uid}_${widget.article.id}';
  }

  @override
  void initState() {
    super.initState();
    _checkFavorite();
  }

  Future<void> _checkFavorite() async {
    final doc = await FirebaseFirestore.instance
        .collection('favorites')
        .doc(_docId)
        .get();
    setState(() {
      _isFavorite = doc.exists;
      _loading = false;
    });
  }

  Future<void> _toggleFavorite() async {
    final ref = FirebaseFirestore.instance.collection('favorites').doc(_docId);
    final uid = AuthService.currentUser?.uid ?? 'guest';

    if (_isFavorite) {
      await ref.delete();
    } else {
      // Menyimpan ID serta judul artikel ke Firestore collection "favorites"
      await ref.set({
        'userId': uid,
        'articleId': widget.article.id,
        'title': widget.article.title,
        'imageUrl': widget.article.imageUrl,
        'newsSite': widget.article.newsSite,
        'createdAt': FieldValue.serverTimestamp(),
      });
    }

    setState(() => _isFavorite = !_isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    final article = widget.article;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFEF4444),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          if (!_loading)
            IconButton(
              icon: Icon(
                _isFavorite ? Icons.favorite : Icons.favorite_border,
                color: _isFavorite ? Colors.red[200] : Colors.white,
              ),
              onPressed: _toggleFavorite,
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              article.imageUrl,
              width: double.infinity,
              height: 240,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  Container(height: 240, color: Colors.grey[300]),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Chip(label: Text(article.newsSite)),
                      const SizedBox(width: 8),
                      Text(article.publishedAt,
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(article.summary,
                      style: const TextStyle(fontSize: 15, height: 1.5)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
