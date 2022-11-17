import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ninecoin/features/point/components/purchase_tile.dart';
import '../../../model/transaction/get_history_transaction.dart';
import '../components/pdf_view.dart';
import '../services/purchase_history.dart';
import '../services/url_launcher.dart';

class PurchaseHistoryPage extends StatefulWidget {
  const PurchaseHistoryPage({Key? key}) : super(key: key);

  @override
  State<PurchaseHistoryPage> createState() => _PurchaseHistoryPageState();
}

class _PurchaseHistoryPageState extends State<PurchaseHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      child: FutureBuilder<GetHistoryTransaction>(
        future: purchaseHistory(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.data.transaction.length,
              itemBuilder: (context, index) {
                return PurchaseTile(
                  date:
                      "${snapshot.data!.data.transaction[index].date.year}-${snapshot.data!.data.transaction[index].date.month}-${snapshot.data!.data.transaction[index].date.day}",
                  title: "Apple store",
                  subtitle: "A phone 16 Pro",
                  point: snapshot.data!.data.transaction[index].point,
                  onTap: () async {
                    String url = snapshot.data!.data.transaction[index].pdf;
                    final file = await loadPdfFromNetwork(url);

                    // ignore: use_build_context_synchronously
                    openPdf(context, file, url);
                  },
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  void openPdf(BuildContext context, File file, String url) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PdfViewer(
            file: file,
            url: url,
          ),
        ),
      );
}
