import 'package:cbnits_graphql/configs/size_config.dart';
import 'package:cbnits_graphql/theme/colors.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final String hintText;
  final Function onSearchClick, onClearText;

  const SearchBar(this.hintText, this.onSearchClick, this.onClearText, {Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100 * SizeConfig.widthMultiplier,
      decoration: BoxDecoration(
          color: AppColors.lightGreyColor,
          border: Border.all(color: Colors.white, width: 0.25 * SizeConfig.widthMultiplier),
          borderRadius: BorderRadius.all(Radius.circular(1.5 * SizeConfig.heightMultiplier))
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 2.5 * SizeConfig.widthMultiplier),
            child: Icon(Icons.search_rounded, size: 3.5 * SizeConfig.heightMultiplier, color: AppColors.darkGreyColor,),
          ),
          Expanded(
            child: TextFormField(
              controller: _controller,
              onSaved: (value) {},
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: 2.25 * SizeConfig.textMultiplier,
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.w500
              ),
              textInputAction: TextInputAction.search,
              onChanged: (val) {
                setState(() {});
              },
              onFieldSubmitted: (value) => widget.onSearchClick(value),
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: 2.25 * SizeConfig.textMultiplier,
                  color: AppColors.darkGreyColor,
                ),
                contentPadding: EdgeInsets.all(1.25 * SizeConfig.heightMultiplier),
                border: InputBorder.none,
              ),
            ),
          ),
          _controller.value.text.isNotEmpty? GestureDetector(
            onTap: () {
              setState(() {
                FocusManager.instance.primaryFocus?.unfocus();
                _controller.text = '';
                widget.onClearText();
              });
            },
            child: Container(
                margin: EdgeInsets.only(right: 2.5 * SizeConfig.widthMultiplier),
                child: Icon(Icons.clear_rounded, size: 3 * SizeConfig.heightMultiplier,)
            ),
          ) : const SizedBox(),
        ],
      ),
    );
  }
}
