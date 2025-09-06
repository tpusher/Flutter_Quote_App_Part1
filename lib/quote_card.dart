import 'package:flutter/material.dart';
import 'quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final VoidCallback onLikePressed;
  final VoidCallback onDeletePressed;

  QuoteCard({
    required this.quote,
    required this.onLikePressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              quote.text,
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            SizedBox(height: 6),
            Center(
              child: Text(
                quote.author,
                style: TextStyle(fontSize: 14, color: Colors.grey[800]),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 8.0,
                    ),
                    backgroundColor: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: onLikePressed,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.thumb_up, color: Colors.blue),
                      SizedBox(width: 8), // spacing between icon and text
                      Text(
                        '${quote.likes ?? 0}', // safely show likes even if null
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),

                ElevatedButton(
                  child: Icon(Icons.delete),
                  onPressed: onDeletePressed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
