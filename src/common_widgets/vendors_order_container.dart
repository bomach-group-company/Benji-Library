import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../providers/constants.dart';

class VendorsOrderContainer extends StatelessWidget {
  const VendorsOrderContainer({
    super.key,
    required this.mediaWidth,
    required String orderImage,
    required int orderID,
    required this.formattedDateAndTime,
    required String orderItem,
    required int itemQuantity,
    required double itemPrice,
    required String customerName,
    required String customerAddress,
  })  : _orderImage = orderImage,
        _orderID = orderID,
        _orderItem = orderItem,
        _itemQuantity = itemQuantity,
        _itemPrice = itemPrice,
        _customerName = customerName,
        _customerAddress = customerAddress;

  final double mediaWidth;
  final String _orderImage;
  final int _orderID;
  final String formattedDateAndTime;
  final String _orderItem;
  final int _itemQuantity;
  final double _itemPrice;
  final String _customerName;
  final String _customerAddress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: kDefaultPadding / 2,
      ),
      padding: const EdgeInsets.only(
        top: kDefaultPadding / 2,
        left: kDefaultPadding / 2,
        right: kDefaultPadding / 2,
      ),
      width: mediaWidth / 1.1,
      height: 150,
      decoration: ShapeDecoration(
        color: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kDefaultPadding),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 24,
            offset: Offset(0, 4),
            spreadRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: kPageSkeletonColor,
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/products/$_orderImage.png",
                    ),
                  ),
                ),
              ),
              kHalfSizedBox,
              Text(
                "#00${_orderID.toString()}",
                style: TextStyle(
                  color: kTextGreyColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          kWidthSizedBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: mediaWidth / 1.55,
                // color: kAccentColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      child: Text(
                        "Hot Kitchen",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        formattedDateAndTime,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              kHalfSizedBox,
              Container(
                color: kTransparentColor,
                width: 250,
                child: Text(
                  _orderItem,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              kHalfSizedBox,
              Container(
                width: 200,
                color: kTransparentColor,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "x $_itemQuantity",
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const TextSpan(text: "  "),
                      TextSpan(
                        text: "₦ ${_itemPrice.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: 'sen',
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              kHalfSizedBox,
              Container(
                color: kGreyColor1,
                height: 1,
                width: mediaWidth / 1.8,
              ),
              kHalfSizedBox,
              SizedBox(
                width: mediaWidth / 1.8,
                child: Text(
                  _customerName,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                width: mediaWidth / 1.8,
                child: Text(
                  _customerAddress,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
