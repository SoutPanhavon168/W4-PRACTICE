import 'package:flutter/material.dart';

import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller});

  final DownloadController controller;

  // TODO
  String downloadSize(double progress) {
    return ((progress / 100) * controller.ressource.size).toString();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        switch (controller.status) {
          case DownloadStatus.notDownloaded:
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  subtitle: Text(
                    ""
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      controller.startDownload();
                    },
                    icon: Icon(Icons.download),
                  ),
                  title: Text(
                    controller.ressource.name,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
            );
          case DownloadStatus.downloading:
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  subtitle: Text("${controller.progress}% completed - ${downloadSize(controller.progress)} of ${controller.ressource.size} MB"),
                  trailing: IconButton(
                    onPressed: () {
                      controller.startDownload();
                    },
                    icon: Icon(Icons.downloading),
                  ),
                  title: Text(
                    controller.ressource.name,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
            );
          case DownloadStatus.downloaded:
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  subtitle: Text(
                    "${controller.progress}% completed - ${downloadSize(controller.progress)} of ${controller.ressource.size} MB",
                  ),
                  trailing: Icon(Icons.folder),
                  title: Text(
                    controller.ressource.name,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
            );
        }
      },
    );
    // TODO
  }
}
