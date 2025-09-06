import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() => runApp(MaterialApp(home: QuoteList()));

class QuoteList extends StatefulWidget {
  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote('Be yourself, everyone else is already taken', 'Osca Wilde'),
    Quote('I have nothing to declare except my genus', 'Osca Wilde'),
    Quote('The truth is rarely pure and never simple', 'Osca Wilde'),
  ];

  Widget quoteTemplate(quote, context) {
    return QuoteCard(
      quote: quote,
      onLikePressed: () => increment_likes(quote),
      onDeletePressed: () => delete_quote(quote),
    );
  }

  void increment_likes(Quote quote) {
    setState(() {
      quote.likes = (quote.likes ?? 0) + 1;
    });
  }

  void delete_quote(Quote quote) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete this quote?'),
        content: Text('Are you sure you want to delete this quote?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      setState(() {
        quotes.remove(quote);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awesome Quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: quotes.map((quote) => quoteTemplate(quote, context)).toList(),
      ),
    );
  }
}
