import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarttextile/main_content/components/grey_header.dart';
import 'package:smarttextile/main_content/provider/provider_counter.dart';
import 'package:smarttextile/main_content/provider/provider_product_filter.dart';
import 'package:smarttextile/main_content/screens/shared/retailers_list.dart';
import 'package:smarttextile/main_content/shared/size_config.dart';

class ProductFilter extends StatefulWidget {
  final ProviderProductsFilter provider;
  ProductFilter({this.provider});
  @override
  _ProductFilterState createState() => _ProductFilterState();
}

class _ProductFilterState extends State<ProductFilter> {
  List<String> _filterOccassion = [];
  List<String> _filterColor = [];
  List<String> _filterSize = [];
  List<String> _filterPattern = [];
  String _filterBlouseFabric;
  String _filterFabric;
  String _filterSetContent;
  String _filterWork;
  String _filterSampleOrders;
  String _filterStichedType;
  String _filterSleeveType;
  String _filterWidth;
  String _filterMaterial;
  String _filetrBrand;
  String _filterUse;
  ProviderProductsFilter providerProductsFilter;
  int _filterSelected = 0;
  @override
  void initState() {
    super.initState();
    providerProductsFilter = widget.provider;
    _filterOccassion.addAll(providerProductsFilter.filterOcassion);
    _filterColor.addAll(providerProductsFilter.filterColor);
    _filterSize.addAll(providerProductsFilter.filterSize);
    _filterPattern.addAll(providerProductsFilter.filterPattern);
    _filterBlouseFabric = providerProductsFilter.blouseFabric;
    _filterFabric = providerProductsFilter.fabric;
    _filterSetContent = providerProductsFilter.setContent;
    _filterWork = providerProductsFilter.work;
    _filterSampleOrders = providerProductsFilter.sampleOrders;
    _filterStichedType = providerProductsFilter.stichedType;
    _filterSleeveType = providerProductsFilter.sleeveType;
    _filterWidth = providerProductsFilter.width;
    _filterMaterial = providerProductsFilter.material;
    _filetrBrand = providerProductsFilter.brand;
    _filterUse = providerProductsFilter.use;
  }

  @override
  Widget build(BuildContext context) {
    ProviderCounter providerCounter = Provider.of<ProviderCounter>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 13),
              child: GreyHeader(
                name: "Filters",
                color: Color(0xffEBEBEB),
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 20,
              width: double.maxFinite,
            ),
            FadeInRight(
              child: GestureDetector(
                onTap: () {
                  providerProductsFilter.clearAll();
                  _filterOccassion = [];
                  _filterColor = [];
                  _filterSize = [];
                  _filterPattern = [];
                  _filterBlouseFabric = "";
                  _filterFabric = "";
                  _filterSetContent = "";
                  _filterWork = "";
                  _filterSampleOrders = "";
                  _filterStichedType = "";
                  _filterSleeveType = "";
                  _filterWidth = "";
                  _filterMaterial = "";
                  _filetrBrand = "";
                  _filterUse = "";
                  _filterSelected = 1;
                  setState(() {});
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: SizeConfig.safeBlockHorizontal * 96,
                    padding: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 5,
                      top: SizeConfig.safeBlockVertical * 8,
                      bottom: SizeConfig.safeBlockVertical * 8,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xffFF7171),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          SizeConfig.safeBlockVertical * 25,
                        ),
                        bottomLeft: Radius.circular(
                          SizeConfig.safeBlockVertical * 25,
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.16),
                          offset: Offset(0, 3),
                          blurRadius: SizeConfig.safeBlockVertical * 6,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "Reset",
                        style: TextStyle(
                          fontFamily: "Seogoe UI L",
                          fontSize: SizeConfig.safeBlockHorizontal * 17,
                          //fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  FadeInLeft(
                    child: Container(
                      width: SizeConfig.safeBlockHorizontal * 150,
                      height: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(
                            SizeConfig.safeBlockVertical * 50,
                          ),
                          bottomRight: Radius.circular(
                            SizeConfig.safeBlockVertical * 50,
                          ),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff4998C5).withOpacity(0.2),
                            blurRadius: SizeConfig.safeBlockVertical * 3,
                          ),
                          BoxShadow(
                            color: Color(0xff4998C5).withOpacity(0.3),
                            blurRadius: SizeConfig.safeBlockVertical * 10,
                            offset: Offset(0, SizeConfig.safeBlockVertical * 5),
                          ),
                        ],
                      ),
                      child: ListView(
                        children: providerProductsFilter.productType == "Saree"
                            ? <Widget>[
                                ProductFilterOptionContainer(
                                  onTap: () {
                                    setState(() {
                                      _filterSelected = 1;
                                    });
                                  },
                                  name: "Occassion",
                                  curve: true,
                                  selected: _filterSelected == 1,
                                ),
                                ProductFilterOptionContainer(
                                  onTap: () {
                                    setState(() {
                                      _filterSelected = 2;
                                    });
                                  },
                                  name: "Color",
                                  selected: _filterSelected == 2,
                                ),
                                ProductFilterOptionContainer(
                                  onTap: () {
                                    setState(() {
                                      _filterSelected = 3;
                                    });
                                  },
                                  name: "Blouse Fabric",
                                  selected: _filterSelected == 3,
                                ),
                                ProductFilterOptionContainer(
                                  onTap: () {
                                    setState(() {
                                      _filterSelected = 4;
                                    });
                                  },
                                  name: "Fabric",
                                  selected: _filterSelected == 4,
                                ),
                                ProductFilterOptionContainer(
                                  onTap: () {
                                    setState(() {
                                      _filterSelected = 5;
                                    });
                                  },
                                  name: "Pattern",
                                  selected: _filterSelected == 5,
                                ),
                                ProductFilterOptionContainer(
                                  onTap: () {
                                    setState(() {
                                      _filterSelected = 6;
                                    });
                                  },
                                  name: "SetContent",
                                  selected: _filterSelected == 6,
                                ),
                                ProductFilterOptionContainer(
                                  onTap: () {
                                    setState(() {
                                      _filterSelected = 7;
                                    });
                                  },
                                  name: "Work",
                                  selected: _filterSelected == 7,
                                ),
                                ProductFilterOptionContainer(
                                  onTap: () {
                                    setState(() {
                                      _filterSelected = 8;
                                    });
                                  },
                                  name: "Sample Orders",
                                  selected: _filterSelected == 8,
                                ),
                              ]
                            : providerProductsFilter.productType == "Kurti"
                                ? <Widget>[
                                    ProductFilterOptionContainer(
                                      onTap: () {
                                        setState(() {
                                          _filterSelected = 1;
                                        });
                                      },
                                      name: "Occassion",
                                      curve: true,
                                      selected: _filterSelected == 1,
                                    ),
                                    ProductFilterOptionContainer(
                                      onTap: () {
                                        setState(() {
                                          _filterSelected = 9;
                                        });
                                      },
                                      name: "Size",
                                      selected: _filterSelected == 9,
                                    ),
                                    ProductFilterOptionContainer(
                                      onTap: () {
                                        setState(() {
                                          _filterSelected = 2;
                                        });
                                      },
                                      name: "Color",
                                      selected: _filterSelected == 2,
                                    ),
                                    ProductFilterOptionContainer(
                                      onTap: () {
                                        setState(() {
                                          _filterSelected = 4;
                                        });
                                      },
                                      name: "Fabric",
                                      selected: _filterSelected == 4,
                                    ),
                                    ProductFilterOptionContainer(
                                      onTap: () {
                                        setState(() {
                                          _filterSelected = 5;
                                        });
                                      },
                                      name: "Pattern",
                                      selected: _filterSelected == 5,
                                    ),
                                    ProductFilterOptionContainer(
                                      onTap: () {
                                        setState(() {
                                          _filterSelected = 10;
                                        });
                                      },
                                      name: "Stitched Type",
                                      selected: _filterSelected == 10,
                                    ),
                                    ProductFilterOptionContainer(
                                      onTap: () {
                                        setState(() {
                                          _filterSelected = 11;
                                        });
                                      },
                                      name: "Sleeve type",
                                      selected: _filterSelected == 11,
                                    ),
                                    ProductFilterOptionContainer(
                                      onTap: () {
                                        setState(() {
                                          _filterSelected = 8;
                                        });
                                      },
                                      name: "Sample Orders",
                                      selected: _filterSelected == 8,
                                    ),
                                  ]
                                : providerProductsFilter.productType == "Dress"
                                    ? <Widget>[
                                        ProductFilterOptionContainer(
                                          onTap: () {
                                            setState(() {
                                              _filterSelected = 1;
                                            });
                                          },
                                          name: "Occassion",
                                          selected: _filterSelected == 1,
                                          curve: true,
                                        ),
                                        ProductFilterOptionContainer(
                                          onTap: () {
                                            setState(() {
                                              _filterSelected = 9;
                                            });
                                          },
                                          name: "Size",
                                          selected: _filterSelected == 9,
                                        ),
                                        ProductFilterOptionContainer(
                                          onTap: () {
                                            setState(() {
                                              _filterSelected = 2;
                                            });
                                          },
                                          name: "Color",
                                          selected: _filterSelected == 2,
                                        ),
                                        ProductFilterOptionContainer(
                                          onTap: () {
                                            setState(() {
                                              _filterSelected = 4;
                                            });
                                          },
                                          name: "Fabric",
                                          selected: _filterSelected == 4,
                                        ),
                                        ProductFilterOptionContainer(
                                          onTap: () {
                                            setState(() {
                                              _filterSelected = 5;
                                            });
                                          },
                                          name: "Pattern",
                                          selected: _filterSelected == 5,
                                        ),
                                        ProductFilterOptionContainer(
                                          onTap: () {
                                            setState(() {
                                              _filterSelected = 10;
                                            });
                                          },
                                          name: "Stitched Type",
                                          selected: _filterSelected == 10,
                                        ),
                                        ProductFilterOptionContainer(
                                          onTap: () {
                                            setState(() {
                                              _filterSelected = 7;
                                            });
                                          },
                                          name: "Work",
                                          selected: _filterSelected == 7,
                                        ),
                                        ProductFilterOptionContainer(
                                          onTap: () {
                                            setState(() {
                                              _filterSelected = 8;
                                            });
                                          },
                                          name: "Sample Orders",
                                          selected: _filterSelected == 8,
                                        ),
                                      ]
                                    : providerProductsFilter.productType ==
                                            "Fabric"
                                        ? <Widget>[
                                            ProductFilterOptionContainer(
                                              onTap: () {
                                                setState(() {
                                                  _filterSelected = 12;
                                                });
                                              },
                                              curve: true,
                                              name: "Width",
                                              selected: _filterSelected == 12,
                                            ),
                                            ProductFilterOptionContainer(
                                              onTap: () {
                                                setState(() {
                                                  _filterSelected = 8;
                                                });
                                              },
                                              name: "Sample Orders",
                                              selected: _filterSelected == 8,
                                            ),
                                            ProductFilterOptionContainer(
                                              onTap: () {
                                                setState(() {
                                                  _filterSelected = 13;
                                                });
                                              },
                                              name: "Material",
                                              selected: _filterSelected == 13,
                                            ),
                                            ProductFilterOptionContainer(
                                              onTap: () {
                                                setState(() {
                                                  _filterSelected = 14;
                                                });
                                              },
                                              name: "Use",
                                              selected: _filterSelected == 14,
                                            ),
                                            ProductFilterOptionContainer(
                                              onTap: () {
                                                setState(() {
                                                  _filterSelected = 5;
                                                });
                                              },
                                              name: "Pattern",
                                              selected: _filterSelected == 5,
                                            ),
                                          ]
                                        : providerProductsFilter.productType ==
                                                "Ethenic Wear"
                                            ? <Widget>[
                                                ProductFilterOptionContainer(
                                                  curve: true,
                                                  onTap: () {
                                                    setState(() {
                                                      _filterSelected = 1;
                                                    });
                                                  },
                                                  name: "Occassion",
                                                  selected:
                                                      _filterSelected == 1,
                                                ),
                                                ProductFilterOptionContainer(
                                                  onTap: () {
                                                    setState(() {
                                                      _filterSelected = 2;
                                                    });
                                                  },
                                                  name: "Color",
                                                  selected:
                                                      _filterSelected == 2,
                                                ),
                                                ProductFilterOptionContainer(
                                                  onTap: () {
                                                    setState(() {
                                                      _filterSelected = 7;
                                                    });
                                                  },
                                                  name: "Work",
                                                  selected:
                                                      _filterSelected == 7,
                                                ),
                                                ProductFilterOptionContainer(
                                                  onTap: () {
                                                    setState(() {
                                                      _filterSelected = 10;
                                                    });
                                                  },
                                                  name: "Stitched Type",
                                                  selected:
                                                      _filterSelected == 10,
                                                ),
                                                ProductFilterOptionContainer(
                                                  onTap: () {
                                                    setState(() {
                                                      _filterSelected = 8;
                                                    });
                                                  },
                                                  name: "Sample Order",
                                                  selected:
                                                      _filterSelected == 8,
                                                ),
                                                ProductFilterOptionContainer(
                                                  onTap: () {
                                                    setState(() {
                                                      _filterSelected = 4;
                                                    });
                                                  },
                                                  name: "Fabric",
                                                  selected:
                                                      _filterSelected == 4,
                                                ),
                                              ]
                                            : <Widget>[
                                                ProductFilterOptionContainer(
                                                  curve: true,
                                                  onTap: () {
                                                    setState(() {
                                                      _filterSelected = 4;
                                                    });
                                                  },
                                                  name: "Fabric",
                                                  selected:
                                                      _filterSelected == 4,
                                                ),
                                                ProductFilterOptionContainer(
                                                  onTap: () {
                                                    setState(() {
                                                      _filterSelected = 15;
                                                    });
                                                  },
                                                  name: "Brand",
                                                  selected:
                                                      _filterSelected == 15,
                                                ),
                                                ProductFilterOptionContainer(
                                                  onTap: () {
                                                    setState(() {
                                                      _filterSelected = 5;
                                                    });
                                                  },
                                                  name: "Pattern",
                                                  selected:
                                                      _filterSelected == 5,
                                                ),
                                                ProductFilterOptionContainer(
                                                  onTap: () {
                                                    setState(() {
                                                      _filterSelected = 8;
                                                    });
                                                  },
                                                  name: "Sample Order",
                                                  selected:
                                                      _filterSelected == 8,
                                                ),
                                              ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        left: SizeConfig.safeBlockHorizontal * 30,
                        right: SizeConfig.safeBlockHorizontal * 5,
                        top: SizeConfig.safeBlockVertical * 18,
                        bottom: SizeConfig.safeBlockVertical * 5,
                      ),
                      child: FadeInUp(
                        child: _filterSelected == 1
                            ? CheckBoxFilter(
                                list: FilterList().occassion,
                                name: "Occassion",
                                onTap: (String occasion, bool onChanged) {
                                  if (onChanged) {
                                    if (!_filterOccassion.contains(occasion)) {
                                      _filterOccassion.add(occasion);
                                    }
                                  } else {
                                    if (_filterOccassion.contains(occasion)) {
                                      _filterOccassion.remove(occasion);
                                    }
                                  }
                                },
                                filterlist: _filterOccassion,
                              )
                            : _filterSelected == 2
                                ? CheckBoxFilter(
                                    list: FilterList().color,
                                    name: "Color",
                                    onTap: (String color, bool onChanged) {
                                      if (onChanged) {
                                        if (!_filterColor.contains(color)) {
                                          _filterColor.add(color);
                                        }
                                      } else {
                                        if (_filterColor.contains(color)) {
                                          _filterColor.remove(color);
                                        }
                                      }
                                    },
                                    filterlist: _filterColor,
                                  )
                                : _filterSelected == 3
                                    ? BlouseFabricFilter(
                                        selected: _filterBlouseFabric,
                                        onTap: (String value) {
                                          _filterBlouseFabric = value;
                                        },
                                      )
                                    : _filterSelected == 4
                                        ? SareeFabricFilter(
                                            selected: _filterFabric,
                                            onTap: (String value) {
                                              _filterFabric = value;
                                            },
                                          )
                                        : _filterSelected == 5
                                            ? CheckBoxFilter(
                                                list: FilterList().pattern,
                                                name: "Pattern",
                                                onTap: (String pattern,
                                                    bool onChanged) {
                                                  if (onChanged) {
                                                    if (!_filterPattern
                                                        .contains(pattern)) {
                                                      _filterPattern
                                                          .add(pattern);
                                                    }
                                                  } else {
                                                    if (_filterPattern
                                                        .contains(pattern)) {
                                                      _filterPattern
                                                          .remove(pattern);
                                                    }
                                                  }
                                                },
                                                filterlist: _filterPattern,
                                              )
                                            : _filterSelected == 6
                                                ? SetContentFilter(
                                                    selected: _filterSetContent,
                                                    onTap: (String value) {
                                                      _filterSetContent = value;
                                                    },
                                                  )
                                                : _filterSelected == 7
                                                    ? WorkFilter(
                                                        selected: _filterWork,
                                                        onTap: (String value) {
                                                          _filterWork = value;
                                                        },
                                                      )
                                                    : _filterSelected == 8
                                                        ? SampleOrdersFilter(
                                                            selected:
                                                                _filterSampleOrders,
                                                            onTap:
                                                                (String value) {
                                                              _filterSampleOrders =
                                                                  value;
                                                            },
                                                          )
                                                        : _filterSelected == 9
                                                            ? CheckBoxFilter(
                                                                list:
                                                                    FilterList()
                                                                        .size,
                                                                name: "Size",
                                                                onTap: (String
                                                                        size,
                                                                    bool
                                                                        onChanged) {
                                                                  if (onChanged) {
                                                                    if (!_filterSize
                                                                        .contains(
                                                                            size)) {
                                                                      _filterSize
                                                                          .add(
                                                                              size);
                                                                    }
                                                                  } else {
                                                                    if (_filterSize
                                                                        .contains(
                                                                            size)) {
                                                                      _filterSize
                                                                          .remove(
                                                                              size);
                                                                    }
                                                                  }
                                                                },
                                                                filterlist:
                                                                    _filterSize,
                                                              )
                                                            : _filterSelected ==
                                                                    10
                                                                ? StichedtypeFilter(
                                                                    selected:
                                                                        _filterStichedType,
                                                                    onTap: (String
                                                                        value) {
                                                                      _filterStichedType =
                                                                          value;
                                                                    },
                                                                  )
                                                                : _filterSelected ==
                                                                        11
                                                                    ? SleeveTypeFilter(
                                                                        selected:
                                                                            _filterSleeveType,
                                                                        onTap: (String
                                                                            value) {
                                                                          _filterSleeveType =
                                                                              value;
                                                                        },
                                                                      )
                                                                    : _filterSelected ==
                                                                            12
                                                                        ? WidthFilter(
                                                                            selected:
                                                                                _filterWidth,
                                                                            onTap:
                                                                                (String value) {
                                                                              _filterWidth = value;
                                                                            },
                                                                          )
                                                                        : _filterSelected ==
                                                                                13
                                                                            ? MaterialsFilter(
                                                                                selected: _filterMaterial,
                                                                                onTap: (String value) {
                                                                                  _filterMaterial = value;
                                                                                },
                                                                              )
                                                                            : _filterSelected == 14
                                                                                ? UseFilter(
                                                                                    selected: _filterUse,
                                                                                    onTap: (String value) {
                                                                                      _filterUse = value;
                                                                                    },
                                                                                  )
                                                                                : _filterSelected == 15
                                                                                    ? BrandFilter(
                                                                                        selected: _filetrBrand,
                                                                                        onTap: (String value) {
                                                                                          _filetrBrand = value;
                                                                                        },
                                                                                      )
                                                                                    : Container(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FadeInRight(
              child: GestureDetector(
                onTap: () {
                  providerProductsFilter.setBlouseFabric(_filterBlouseFabric);
                  providerProductsFilter.setBrand(_filetrBrand);
                  providerProductsFilter.setColor(_filterColor);
                  providerProductsFilter.setFabric(_filterFabric);
                  providerProductsFilter.setMaterial(_filterMaterial);

                  providerProductsFilter.setOccassion(_filterOccassion);
                  providerProductsFilter.setPattern(_filterPattern);
                  providerProductsFilter.setSampleOrders(_filterSampleOrders);
                  providerProductsFilter.setSetContent(_filterSetContent);
                  providerProductsFilter.setSize(_filterSize);
                  providerProductsFilter.setSleeveType(_filterSleeveType);
                  providerProductsFilter.setStichedType(_filterStichedType);
                  providerProductsFilter.setUse(_filterUse);
                  providerProductsFilter.setWidth(_filterWidth);
                  providerProductsFilter.setWork(_filterWork);
                  Navigator.pop(context);
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: SizeConfig.safeBlockHorizontal * 96,
                    padding: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 5,
                      top: SizeConfig.safeBlockVertical * 8,
                      bottom: SizeConfig.safeBlockVertical * 8,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xffA2D1FF),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          SizeConfig.safeBlockVertical * 25,
                        ),
                        bottomLeft: Radius.circular(
                          SizeConfig.safeBlockVertical * 25,
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.16),
                          offset: Offset(0, 3),
                          blurRadius: SizeConfig.safeBlockVertical * 6,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "Save",
                        style: TextStyle(
                          fontFamily: "Seogoe UI L",
                          fontSize: SizeConfig.safeBlockHorizontal * 17,
                          //fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 25,
            ),
          ],
        ),
      ),
    );
  }
}

class ProductFilterOptionContainer extends StatelessWidget {
  final Function onTap;
  final name;
  final bool selected;
  final bool curve;
  ProductFilterOptionContainer(
      {this.onTap, this.name, this.selected, this.curve = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.only(
              left: SizeConfig.safeBlockHorizontal * 20,
              bottom: SizeConfig.safeBlockVertical * 7,
              right: SizeConfig.safeBlockHorizontal * 5,
            ),
            height: SizeConfig.safeBlockVertical * 50,
            width: double.maxFinite,
            decoration: curve
                ? BoxDecoration(
                    color: selected == false
                        ? Colors.transparent
                        : Color(0xff00aad4).withOpacity(0.25),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                        SizeConfig.safeBlockVertical * 50,
                      ),
                    ),
                  )
                : BoxDecoration(
                    color: selected == false
                        ? Colors.transparent
                        : Color(0xff00aad4).withOpacity(0.25),
                  ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: FittedBox(
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 20,
                    fontFamily: "Segoe UI",
                    color: Color(0xff646464),
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: SizeConfig.safeBlockHorizontal * 20,
          ),
          height: SizeConfig.safeBlockVertical * 0.6,
          width: SizeConfig.safeBlockHorizontal * 130,
          color: Colors.black,
        ),
      ],
    );
  }
}

class CheckBoxFilter extends StatefulWidget {
  final list;
  final name;
  final Function onTap;
  final filterlist;
  CheckBoxFilter(
      {@required this.list,
      @required this.name,
      @required this.onTap,
      @required this.filterlist});
  @override
  _CheckBoxFilterState createState() => _CheckBoxFilterState();
}

class _CheckBoxFilterState extends State<CheckBoxFilter> {
  Iterable<Widget> get checkBoxWidget sync* {
    for (var item in widget.list) {
      yield Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical * 9,
        ),
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 20,
              width: 20,
              child: Checkbox(
                  value: widget.filterlist.contains(item),
                  onChanged: (bool onChnaged) {
                    if (onChnaged) {
                      widget.filterlist.add(item);
                      widget.onTap(item, onChnaged);
                    } else {
                      widget.filterlist.remove(item);
                      widget.onTap(item, onChnaged);
                    }
                    setState(() {});
                  }),
            ),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal * 10,
            ),
            Text(
              item,
              style: TextStyle(
                fontFamily: "Segoe UI",
                fontSize: SizeConfig.safeBlockHorizontal * 15,
                color: Color(0xff002358),
                letterSpacing: 0.5,
              ),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.name,
          style: TextStyle(
            letterSpacing: SizeConfig.safeBlockHorizontal * 1,
            fontSize: SizeConfig.safeBlockHorizontal * 17,
            fontFamily: "Segoe Ui",
            color: Color(0xff002358),
          ),
        ),
        SizedBox(
          height: SizeConfig.safeBlockVertical * 10,
        ),
        Column(
          children: checkBoxWidget.toList(),
        ),
      ],
    );
  }
}

class BlouseFabricFilter extends StatefulWidget {
  final Function onTap;
  final String selected;
  BlouseFabricFilter({this.onTap, this.selected});
  @override
  _BlouseFabricFilterState createState() => _BlouseFabricFilterState();
}

class _BlouseFabricFilterState extends State<BlouseFabricFilter> {
  int _selectedItem = 0;
  List _blouseFabricList = [];

  Iterable<Widget> get radioWidget sync* {
    for (var item in _blouseFabricList) {
      yield Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical * 9,
        ),
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 20,
              width: 20,
              child: Radio(
                value: (_blouseFabricList.indexOf(item) + 1),
                groupValue: _selectedItem,
                onChanged: (val) {
                  setState(() {
                    _selectedItem = _blouseFabricList.indexOf(item) + 1;
                    widget.onTap(item);
                  });
                },
                activeColor: Color(0xff00aad4).withOpacity(0.8),
              ),
            ),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal * 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  right: SizeConfig.safeBlockHorizontal * 5,
                ),
                child: Text(
                  item,
                  style: TextStyle(
                    fontFamily: "Segoe UI",
                    fontSize: SizeConfig.safeBlockHorizontal * 15,
                    color: Color(0xff002358),
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    _blouseFabricList = FilterList()._blouseFabric;
    super.initState();
    _selectedItem = widget.selected == ""
        ? 0
        : (_blouseFabricList.indexOf(widget.selected) + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Blouse Fabric",
          style: TextStyle(
            letterSpacing: SizeConfig.safeBlockHorizontal * 1,
            fontSize: SizeConfig.safeBlockHorizontal * 17,
            fontFamily: "Segoe Ui",
            color: Color(0xff002358),
          ),
        ),
        SizedBox(
          height: SizeConfig.safeBlockVertical * 10,
        ),
        Column(
          children: radioWidget.toList(),
        ),
      ],
    );
  }
}

class SareeFabricFilter extends StatefulWidget {
  final Function onTap;
  final String selected;
  SareeFabricFilter({this.onTap, this.selected});
  @override
  _SareeFabricFilterState createState() => _SareeFabricFilterState();
}

class _SareeFabricFilterState extends State<SareeFabricFilter> {
  int _selectedItem = 0;
  List _fabricList = [];

  Iterable<Widget> get radioWidget sync* {
    for (var item in _fabricList) {
      yield Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical * 9,
        ),
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 20,
              width: 20,
              child: Radio(
                value: (_fabricList.indexOf(item) + 1),
                groupValue: _selectedItem,
                onChanged: (val) {
                  setState(() {
                    _selectedItem = _fabricList.indexOf(item) + 1;
                    widget.onTap(item);
                  });
                },
                activeColor: Color(0xff00aad4).withOpacity(0.8),
              ),
            ),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal * 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  right: SizeConfig.safeBlockHorizontal * 5,
                ),
                child: Text(
                  item,
                  style: TextStyle(
                    fontFamily: "Segoe UI",
                    fontSize: SizeConfig.safeBlockHorizontal * 15,
                    color: Color(0xff002358),
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _fabricList = FilterList().sareeFabric;
    super.initState();
    _selectedItem =
        widget.selected == "" ? 0 : (_fabricList.indexOf(widget.selected) + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Fabric",
          style: TextStyle(
            letterSpacing: SizeConfig.safeBlockHorizontal * 1,
            fontSize: SizeConfig.safeBlockHorizontal * 17,
            fontFamily: "Segoe Ui",
            color: Color(0xff002358),
          ),
        ),
        SizedBox(
          height: SizeConfig.safeBlockVertical * 10,
        ),
        Column(
          children: radioWidget.toList(),
        ),
      ],
    );
  }
}

class SetContentFilter extends StatefulWidget {
  final Function onTap;
  final String selected;
  SetContentFilter({this.onTap, this.selected});
  @override
  _SetContentFilterState createState() => _SetContentFilterState();
}

class _SetContentFilterState extends State<SetContentFilter> {
  int _selectedItem = 0;
  List _setContentList = [];

  Iterable<Widget> get radioWidget sync* {
    for (var item in _setContentList) {
      yield Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical * 9,
        ),
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 20,
              width: 20,
              child: Radio(
                value: (_setContentList.indexOf(item) + 1),
                groupValue: _selectedItem,
                onChanged: (val) {
                  setState(() {
                    _selectedItem = _setContentList.indexOf(item) + 1;
                    widget.onTap(item);
                  });
                },
                activeColor: Color(0xff00aad4).withOpacity(0.8),
              ),
            ),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal * 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  right: SizeConfig.safeBlockHorizontal * 5,
                ),
                child: Text(
                  item,
                  style: TextStyle(
                    fontFamily: "Segoe UI",
                    fontSize: SizeConfig.safeBlockHorizontal * 15,
                    color: Color(0xff002358),
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setContentList = FilterList().setContent;
    _selectedItem = widget.selected == ""
        ? 0
        : (_setContentList.indexOf(widget.selected) + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Set Content",
          style: TextStyle(
            letterSpacing: SizeConfig.safeBlockHorizontal * 1,
            fontSize: SizeConfig.safeBlockHorizontal * 17,
            fontFamily: "Segoe Ui",
            color: Color(0xff002358),
          ),
        ),
        SizedBox(
          height: SizeConfig.safeBlockVertical * 10,
        ),
        Column(
          children: radioWidget.toList(),
        ),
      ],
    );
  }
}

class WorkFilter extends StatefulWidget {
  final Function onTap;
  final String selected;
  WorkFilter({this.onTap, this.selected});
  @override
  _WorkFilterState createState() => _WorkFilterState();
}

class _WorkFilterState extends State<WorkFilter> {
  int _selectedItem = 0;
  List _workList = [];

  Iterable<Widget> get radioWidget sync* {
    for (var item in _workList) {
      yield Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical * 9,
        ),
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 20,
              width: 20,
              child: Radio(
                value: (_workList.indexOf(item) + 1),
                groupValue: _selectedItem,
                onChanged: (val) {
                  setState(() {
                    _selectedItem = _workList.indexOf(item) + 1;
                    widget.onTap(item);
                  });
                },
                activeColor: Color(0xff00aad4).withOpacity(0.8),
              ),
            ),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal * 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  right: SizeConfig.safeBlockHorizontal * 5,
                ),
                child: Text(
                  item,
                  style: TextStyle(
                    fontFamily: "Segoe UI",
                    fontSize: SizeConfig.safeBlockHorizontal * 15,
                    color: Color(0xff002358),
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    _workList = FilterList().work;
    super.initState();
    _selectedItem =
        widget.selected == "" ? 0 : (_workList.indexOf(widget.selected) + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Work",
          style: TextStyle(
            letterSpacing: SizeConfig.safeBlockHorizontal * 1,
            fontSize: SizeConfig.safeBlockHorizontal * 17,
            fontFamily: "Segoe Ui",
            color: Color(0xff002358),
          ),
        ),
        SizedBox(
          height: SizeConfig.safeBlockVertical * 10,
        ),
        Column(
          children: radioWidget.toList(),
        ),
      ],
    );
  }
}

class SampleOrdersFilter extends StatefulWidget {
  final Function onTap;
  final String selected;
  SampleOrdersFilter({this.onTap, this.selected});
  @override
  _SampleOrdersFilterState createState() => _SampleOrdersFilterState();
}

class _SampleOrdersFilterState extends State<SampleOrdersFilter> {
  int _selectedItem = 0;
  List _sampleOrdersList = [];

  Iterable<Widget> get radioWidget sync* {
    for (var item in _sampleOrdersList) {
      yield Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical * 9,
        ),
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 20,
              width: 20,
              child: Radio(
                value: (_sampleOrdersList.indexOf(item) + 1),
                groupValue: _selectedItem,
                onChanged: (val) {
                  setState(() {
                    _selectedItem = _sampleOrdersList.indexOf(item) + 1;
                    widget.onTap(item);
                  });
                },
                activeColor: Color(0xff00aad4).withOpacity(0.8),
              ),
            ),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal * 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  right: SizeConfig.safeBlockHorizontal * 5,
                ),
                child: Text(
                  item,
                  style: TextStyle(
                    fontFamily: "Segoe UI",
                    fontSize: SizeConfig.safeBlockHorizontal * 15,
                    color: Color(0xff002358),
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    _sampleOrdersList = FilterList().sampleOrders;
    super.initState();
    _selectedItem = widget.selected == ""
        ? 0
        : (_sampleOrdersList.indexOf(widget.selected) + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Sample Orders",
          style: TextStyle(
            letterSpacing: SizeConfig.safeBlockHorizontal * 1,
            fontSize: SizeConfig.safeBlockHorizontal * 17,
            fontFamily: "Segoe Ui",
            color: Color(0xff002358),
          ),
        ),
        SizedBox(
          height: SizeConfig.safeBlockVertical * 10,
        ),
        Column(
          children: radioWidget.toList(),
        ),
      ],
    );
  }
}

class StichedtypeFilter extends StatefulWidget {
  final Function onTap;
  final String selected;
  StichedtypeFilter({this.onTap, this.selected});
  @override
  _StichedtypeFilterState createState() => _StichedtypeFilterState();
}

class _StichedtypeFilterState extends State<StichedtypeFilter> {
  int _selectedItem = 0;
  List _sampleOrdersList = [];

  Iterable<Widget> get radioWidget sync* {
    for (var item in _sampleOrdersList) {
      yield Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical * 9,
        ),
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 20,
              width: 20,
              child: Radio(
                value: (_sampleOrdersList.indexOf(item) + 1),
                groupValue: _selectedItem,
                onChanged: (val) {
                  setState(() {
                    _selectedItem = _sampleOrdersList.indexOf(item) + 1;
                    widget.onTap(item);
                  });
                },
                activeColor: Color(0xff00aad4).withOpacity(0.8),
              ),
            ),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal * 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  right: SizeConfig.safeBlockHorizontal * 5,
                ),
                child: Text(
                  item,
                  style: TextStyle(
                    fontFamily: "Segoe UI",
                    fontSize: SizeConfig.safeBlockHorizontal * 15,
                    color: Color(0xff002358),
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    _sampleOrdersList = FilterList().stichedType;
    super.initState();
    _selectedItem = widget.selected == ""
        ? 0
        : (_sampleOrdersList.indexOf(widget.selected) + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Stitched Type",
          style: TextStyle(
            letterSpacing: SizeConfig.safeBlockHorizontal * 1,
            fontSize: SizeConfig.safeBlockHorizontal * 17,
            fontFamily: "Segoe Ui",
            color: Color(0xff002358),
          ),
        ),
        SizedBox(
          height: SizeConfig.safeBlockVertical * 10,
        ),
        Column(
          children: radioWidget.toList(),
        ),
      ],
    );
  }
}

class SleeveTypeFilter extends StatefulWidget {
  final Function onTap;
  final String selected;
  SleeveTypeFilter({this.onTap, this.selected});
  @override
  _SleeveTypeFilterState createState() => _SleeveTypeFilterState();
}

class _SleeveTypeFilterState extends State<SleeveTypeFilter> {
  int _selectedItem = 0;
  List _sleeveTypeList = [];

  Iterable<Widget> get radioWidget sync* {
    for (var item in _sleeveTypeList) {
      yield Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical * 9,
        ),
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 20,
              width: 20,
              child: Radio(
                value: (_sleeveTypeList.indexOf(item) + 1),
                groupValue: _selectedItem,
                onChanged: (val) {
                  setState(() {
                    _selectedItem = _sleeveTypeList.indexOf(item) + 1;
                    widget.onTap(item);
                  });
                },
                activeColor: Color(0xff00aad4).withOpacity(0.8),
              ),
            ),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal * 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  right: SizeConfig.safeBlockHorizontal * 5,
                ),
                child: Text(
                  item,
                  style: TextStyle(
                    fontFamily: "Segoe UI",
                    fontSize: SizeConfig.safeBlockHorizontal * 15,
                    color: Color(0xff002358),
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    _sleeveTypeList = FilterList().sleeveType;
    super.initState();
    _selectedItem = widget.selected == ""
        ? 0
        : (_sleeveTypeList.indexOf(widget.selected) + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Sleeve Type",
          style: TextStyle(
            letterSpacing: SizeConfig.safeBlockHorizontal * 1,
            fontSize: SizeConfig.safeBlockHorizontal * 17,
            fontFamily: "Segoe Ui",
            color: Color(0xff002358),
          ),
        ),
        SizedBox(
          height: SizeConfig.safeBlockVertical * 10,
        ),
        Column(
          children: radioWidget.toList(),
        ),
      ],
    );
  }
}

class WidthFilter extends StatefulWidget {
  final Function onTap;
  final String selected;
  WidthFilter({this.onTap, this.selected});
  @override
  _WidthFilterState createState() => _WidthFilterState();
}

class _WidthFilterState extends State<WidthFilter> {
  int _selectedItem = 0;
  List _width = [];

  Iterable<Widget> get radioWidget sync* {
    for (var item in _width) {
      yield Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical * 9,
        ),
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 20,
              width: 20,
              child: Radio(
                value: (_width.indexOf(item) + 1),
                groupValue: _selectedItem,
                onChanged: (val) {
                  setState(() {
                    _selectedItem = _width.indexOf(item) + 1;
                    widget.onTap(item);
                  });
                },
                activeColor: Color(0xff00aad4).withOpacity(0.8),
              ),
            ),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal * 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  right: SizeConfig.safeBlockHorizontal * 5,
                ),
                child: Text(
                  item,
                  style: TextStyle(
                    fontFamily: "Segoe UI",
                    fontSize: SizeConfig.safeBlockHorizontal * 15,
                    color: Color(0xff002358),
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    _width = FilterList().width;
    super.initState();
    _selectedItem =
        widget.selected == "" ? 0 : (_width.indexOf(widget.selected) + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Width",
          style: TextStyle(
            letterSpacing: SizeConfig.safeBlockHorizontal * 1,
            fontSize: SizeConfig.safeBlockHorizontal * 17,
            fontFamily: "Segoe Ui",
            color: Color(0xff002358),
          ),
        ),
        SizedBox(
          height: SizeConfig.safeBlockVertical * 10,
        ),
        Column(
          children: radioWidget.toList(),
        ),
      ],
    );
  }
}

class MaterialsFilter extends StatefulWidget {
  final Function onTap;
  final String selected;
  MaterialsFilter({this.onTap, this.selected});
  @override
  _MaterialsFilterState createState() => _MaterialsFilterState();
}

class _MaterialsFilterState extends State<MaterialsFilter> {
  int _selectedItem = 0;
  List _materialsList = [];

  Iterable<Widget> get radioWidget sync* {
    for (var item in _materialsList) {
      yield Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical * 9,
        ),
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 20,
              width: 20,
              child: Radio(
                value: (_materialsList.indexOf(item) + 1),
                groupValue: _selectedItem,
                onChanged: (val) {
                  setState(() {
                    _selectedItem = _materialsList.indexOf(item) + 1;
                    widget.onTap(item);
                  });
                },
                activeColor: Color(0xff00aad4).withOpacity(0.8),
              ),
            ),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal * 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  right: SizeConfig.safeBlockHorizontal * 5,
                ),
                child: Text(
                  item,
                  style: TextStyle(
                    fontFamily: "Segoe UI",
                    fontSize: SizeConfig.safeBlockHorizontal * 15,
                    color: Color(0xff002358),
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    _materialsList = FilterList().material;
    super.initState();
    _selectedItem = widget.selected == ""
        ? 0
        : (_materialsList.indexOf(widget.selected) + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Material",
          style: TextStyle(
            letterSpacing: SizeConfig.safeBlockHorizontal * 1,
            fontSize: SizeConfig.safeBlockHorizontal * 17,
            fontFamily: "Segoe Ui",
            color: Color(0xff002358),
          ),
        ),
        SizedBox(
          height: SizeConfig.safeBlockVertical * 10,
        ),
        Column(
          children: radioWidget.toList(),
        ),
      ],
    );
  }
}

class UseFilter extends StatefulWidget {
  final Function onTap;
  final String selected;
  UseFilter({this.onTap, this.selected});
  @override
  _UseFilterState createState() => _UseFilterState();
}

class _UseFilterState extends State<UseFilter> {
  int _selectedItem = 0;
  List _useList = [];

  Iterable<Widget> get radioWidget sync* {
    for (var item in _useList) {
      yield Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical * 9,
        ),
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 20,
              width: 20,
              child: Radio(
                value: (_useList.indexOf(item) + 1),
                groupValue: _selectedItem,
                onChanged: (val) {
                  setState(() {
                    _selectedItem = _useList.indexOf(item) + 1;
                    widget.onTap(item);
                  });
                },
                activeColor: Color(0xff00aad4).withOpacity(0.8),
              ),
            ),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal * 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  right: SizeConfig.safeBlockHorizontal * 5,
                ),
                child: Text(
                  item,
                  style: TextStyle(
                    fontFamily: "Segoe UI",
                    fontSize: SizeConfig.safeBlockHorizontal * 15,
                    color: Color(0xff002358),
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    _useList = FilterList().use;
    super.initState();
    _selectedItem =
        widget.selected == "" ? 0 : (_useList.indexOf(widget.selected) + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Use",
          style: TextStyle(
            letterSpacing: SizeConfig.safeBlockHorizontal * 1,
            fontSize: SizeConfig.safeBlockHorizontal * 17,
            fontFamily: "Segoe Ui",
            color: Color(0xff002358),
          ),
        ),
        SizedBox(
          height: SizeConfig.safeBlockVertical * 10,
        ),
        Column(
          children: radioWidget.toList(),
        ),
      ],
    );
  }
}

class BrandFilter extends StatefulWidget {
  final Function onTap;
  final String selected;
  BrandFilter({this.onTap, this.selected});
  @override
  _BrandFilterState createState() => _BrandFilterState();
}

class _BrandFilterState extends State<BrandFilter> {
  int _selectedItem = 0;
  List _brandList = [];

  Iterable<Widget> get radioWidget sync* {
    for (var item in _brandList) {
      yield Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical * 9,
        ),
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 20,
              width: 20,
              child: Radio(
                value: (_brandList.indexOf(item) + 1),
                groupValue: _selectedItem,
                onChanged: (val) {
                  setState(() {
                    _selectedItem = _brandList.indexOf(item) + 1;
                    widget.onTap(item);
                  });
                },
                activeColor: Color(0xff00aad4).withOpacity(0.8),
              ),
            ),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal * 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  right: SizeConfig.safeBlockHorizontal * 5,
                ),
                child: Text(
                  item,
                  style: TextStyle(
                    fontFamily: "Segoe UI",
                    fontSize: SizeConfig.safeBlockHorizontal * 15,
                    color: Color(0xff002358),
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    _brandList = FilterList().brand;
    super.initState();
    _selectedItem =
        widget.selected == "" ? 0 : (_brandList.indexOf(widget.selected) + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Brand",
          style: TextStyle(
            letterSpacing: SizeConfig.safeBlockHorizontal * 1,
            fontSize: SizeConfig.safeBlockHorizontal * 17,
            fontFamily: "Segoe Ui",
            color: Color(0xff002358),
          ),
        ),
        SizedBox(
          height: SizeConfig.safeBlockVertical * 10,
        ),
        Column(
          children: radioWidget.toList(),
        ),
      ],
    );
  }
}

class FilterList {
  List<String> _occassion;
  List<String> _color;
  List<String> _size;
  List<String> _pattern;
  List<String> _blouseFabric;
  List<String> _sareeFabric;
  List<String> _setContent;
  List<String> _work;
  List<String> _sampleOrders;
  List<String> _stichedType;
  List<String> _sleeveType;
  List<String> _width;
  List<String> _material;
  List<String> _brand;
  List<String> _use;

  List<String> get occassion => _occassion;
  List<String> get color => _color;
  List<String> get size => _size;
  List<String> get pattern => _pattern;
  List<String> get blouseFabric => _blouseFabric;
  List<String> get sareeFabric => _sareeFabric;
  List<String> get setContent => _setContent;
  List<String> get work => _work;
  List<String> get sampleOrders => _sampleOrders;
  List<String> get stichedType => _stichedType;
  List<String> get sleeveType => _sleeveType;
  List<String> get width => _width;
  List<String> get material => _material;
  List<String> get brand => _brand;
  List<String> get use => _use;

  FilterList() {
    _occassion = [
      "Casual Wear",
      "Formal Wear",
      "Party Wear",
      "Wedding Wear",
      "Festival Wear",
      "Regular Wear"
    ];
    _color = [
      "Red",
      "Black",
      "Blue",
      "Brown",
      "Green",
      "Pink",
      "White",
      "Multi Color",
      "Mix Color"
    ];
    _size = [
      "Small (S)",
      "Medium (M)",
      "Large (L)",
      "XL",
      "XXL",
      "Free Size",
      "All Size",
      "Regular"
    ];
    _pattern = ["Plain", "Embroidery", "Printed", "Digital Printed"];
    _blouseFabric = [
      "Georgette",
      "Silk",
      "Net",
      "Cotton",
      "Satin",
      "Synthetic",
      "Banglory Silk"
    ];
    _sareeFabric = [
      "Cotton",
      "Chiffon",
      "Welvet",
      "Rayon",
      "Wollen",
      "Silk",
      "Net",
      "Synthetic",
    ];
    _setContent = [
      "With Blouse Piece",
      "Without Blouse Piece",
    ];
    _work = [
      "Embroidery Work",
      "Kundan Work",
      "Dubka Work",
      "Chiffon",
      "Mirror Work",
      "Zardosi Work",
      "Gota Work"
    ];
    _sampleOrders = ["Yes", "No"];
    _stichedType = ["Semi-Stitched", "Un Stitched", "Readymade"];
    _sleeveType = [
      "Half",
      "Full",
      "Rollup Sleeves",
      "3/4th Sleeve",
      "Sleeveless"
    ];
    _width = ["35-36", "44-45", "58-60", "72", "108"];
    _material = ["Chiffon", "Cotton", "Chanderi", "Brocade", "Silk"];
    _brand = ["Raymond", "Vimal", "Siyaram", "Gwalior", "Grasim"];
    _use = ["Saree", "Sherwani", "Suit", "Kurti"];
  }
}
