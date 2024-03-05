import 'package:xstore/features/shop/models/banner_model.dart';
import 'package:xstore/features/shop/models/brand_model.dart';
import 'package:xstore/features/shop/models/category_model.dart';
import 'package:xstore/features/shop/models/product_attributes_model.dart';
import 'package:xstore/features/shop/models/product_model.dart';
import 'package:xstore/features/shop/models/product_variation_model.dart';
import 'package:xstore/utils/constants/image_strings.dart';
import 'package:xstore/utils/routers/routes.dart';

class XDummyData {
  static final List<BannerModel> banners = [
    BannerModel(
      imageUrl: XImages.banner1,
      targetScreen: XRoutes.search,
      active: true,
    ),
    BannerModel(
      imageUrl: XImages.banner2,
      targetScreen: XRoutes.store,
      active: true,
    ),
    BannerModel(
      imageUrl: XImages.banner3,
      targetScreen: XRoutes.cart,
      active: true,
    ),
    BannerModel(
      imageUrl: XImages.banner5,
      targetScreen: XRoutes.productDetail,
      active: true,
    ),
    BannerModel(
      imageUrl: XImages.banner11,
      targetScreen: XRoutes.search,
      active: false,
    ),
  ];

  static final List<ProductModel> products = [
    ProductModel(
      id: '001',
      title: 'Google White T-Shirt',
      stock: 20,
      price: 49.99,
      thumnail: XImages.googleWT,
      productType: '',
      isFeatured: true,
      description: 'Google White T-Shirt',
      brand: BrandModel(
        id: '1',
        image: XImages.google,
        name: 'Googel',
        productsCount: 50,
        isFeatured: true,
      ),
      salePrice: 30,
      sku: 'GWT1234',
      categoryId: '1',
      productAttributes: [
        ProductAttributesModel(
            name: 'Color', values: ['White', 'Black', 'Red']),
        ProductAttributesModel(
            name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationsModel(
          id: '1',
          stock: 20,
          price: 49.99,
          salePrice: 44.99,
          image: XImages.googleWT,
          attributesValues: {
            'Color': 'White',
            'Size': 'EU 34',
          },
        ),
      ],
    ),
  ];
/*
  static final UserModel user = UserModel(
    id: '35',
    username: '',
    email: 'kasewo7895@veronil.com',
    firstName: 'kasy',
    lastName: 'woo',
    phoneNumber: '+14255522671',
    profilePicture: XImages.google,
    addresses: [
      AddressModel(
        id: '1',
        name: '${user.firstName} ${user.firstName}',
        phoneNumber: '+92',
        street: '83 Fd lovers',
        postalCode: '14986',
        city: 'Lorana',
        state: '',
        country: 'Laviana',
      ),
    ],
  );
  

  static final CartModel cart = CartModel(
    cardId: '001',
    items: [
      CartItemModel(
        productId: '001',
        variationId: '1',
        quantity: 1,
        title: products[0].title,
        image: products[0].thumbnail,
        brandName: products[0].brand!.name,
        price: products[0].productVariations![0].price,
        selectedVariation: products[0].productVariation,
      ),
    ],
  );

  static final List<OrderModel> orders = [
    OrderModel(
      id : 'XYZ005'
      status : OrderStatus.processing,
      items : cart.items,
      totalAmount : 265,
      orderDate : DateTime(2024, 02, 2),
      orderDate : DateTime(2024, 02, 9),
    ),
  ];
  */

  static final List<CategoryModel> categories = [
    CategoryModel(
      id: '1',
      name: 'Clothes',
      image: XImages.clothes1,
      isFeatured: true,
    ),
    CategoryModel(
      id: '2',
      name: 'Sports',
      image: XImages.sports,
      isFeatured: true,
    ),
    CategoryModel(
      id: '3',
      name: 'Electronics',
      image: XImages.electronics,
      isFeatured: true,
    ),
    CategoryModel(
      id: '4',
      name: 'Cosmetics',
      image: XImages.cosmetics,
      isFeatured: true,
    ),
    CategoryModel(
      id: '5',
      name: 'Books',
      image: XImages.books,
      isFeatured: true,
    ),
    CategoryModel(
      id: '6',
      name: 'Mobiles & Tablets',
      image: XImages.mobiles,
      isFeatured: true,
    ),
    CategoryModel(
      id: '7',
      name: 'TV',
      image: XImages.tv,
      isFeatured: true,
    ),
    CategoryModel(
      id: '8',
      name: 'Furniture',
      image: XImages.furniture,
      isFeatured: true,
    ),
  ];
}
