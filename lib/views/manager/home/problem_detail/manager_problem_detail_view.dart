import 'package:flutter/material.dart';
import 'package:fmanager/views/manager/home/problem_detail/manager_problem_detail_logic.dart';
import 'package:get/get.dart';

class ManagerProblemDetailView extends GetView<ManagerProblemDetailLogic> {
  const ManagerProblemDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: IconButton(
          onPressed: () => {},
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: Colors.black,
          ),
        ),
      ),
      title: const Text(
        'Sự cố về cơ sở vật chất',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }

  Widget _buildBody() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Tên người yêu cầu',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 58,
                          height: 58,
                          decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(999)),
                        ),
                        const SizedBox(width: 24),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Lê Văn Hiếu',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '0123456789',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Material(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(999),
                      child: InkWell(
                        onTap: () => {},
                        borderRadius: BorderRadius.circular(999),
                        child: const Padding(
                          padding: EdgeInsets.all(12),
                          child: Icon(
                            Icons.phone,
                            size: 32,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 48),
                const Row(
                  children: <Widget>[
                    SizedBox(
                      width: 100,
                      child: Text(
                        'Thời gian:',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Text('09:05 AM'),
                  ],
                ),
                const SizedBox(height: 48),
                const Row(
                  children: <Widget>[
                    SizedBox(
                      width: 100,
                      child: Text(
                        'Phòng:',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Text('T1101'),
                  ],
                ),
                const SizedBox(height: 48),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 100,
                      child: Text(
                        'Mô tả sự cố:',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Expanded(
                      child: Text('Bóng đèn cháy, lỗi TV, lỗi điều hòa'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Tiếp nhận',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
