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
        name: 'Google',
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
        ProductVariationsModel(
          id: '2',
          stock: 20,
          price: 49.99,
          salePrice: 44.99,
          image: XImages.googleWT,
          attributesValues: {
            'Color': 'Black',
            'Size': 'EU 34',
          },
        ),
        ProductVariationsModel(
          id: '3',
          stock: 10,
          price: 49.99,
          salePrice: 44.99,
          image: XImages.googleWT,
          attributesValues: {
            'Color': 'Red',
            'Size': 'EU 32',
          },
        ),
      ],
      date: DateTime.now(),
    ),
    ProductModel(
      id: '002',
      title: 'Google Black T-Shirt',
      stock: 20,
      price: 49.99,
      thumnail: XImages.googleWT,
      productType: '',
      isFeatured: true,
      description: 'Google Black T-Shirt',
      brand: BrandModel(
        id: '1',
        image: XImages.google,
        name: 'Google',
        productsCount: 50,
        isFeatured: true,
      ),
      salePrice: 30,
      sku: 'GBT1234',
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
      date: DateTime.now(),
    ),
    ProductModel(
      id: '003',
      title: 'Google Red T-Shirt',
      stock: 20,
      price: 49.99,
      thumnail: XImages.googleWT,
      productType: '',
      isFeatured: true,
      description: 'Google Red T-Shirt',
      brand: BrandModel(
        id: '1',
        image: XImages.google,
        name: 'Google',
        productsCount: 50,
        isFeatured: true,
      ),
      salePrice: 30,
      sku: 'GRT1234',
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
      date: DateTime.now(),
    ),
    ProductModel(
      id: '004',
      title: 'Google Blue T-Shirt',
      stock: 20,
      price: 49.99,
      thumnail: XImages.googleWT,
      productType: 'single',
      isFeatured: true,
      description: 'Google Blue T-Shirt',
      brand: BrandModel(
        id: '1',
        image: XImages.google,
        name: 'Google',
        productsCount: 50,
        isFeatured: true,
      ),
      salePrice: 30,
      sku: 'GBT1234',
      categoryId: '1',
      productAttributes: [
        ProductAttributesModel(
          name: 'Color',
          values: ['White', 'Black', 'Red'],
        ),
        ProductAttributesModel(
          name: 'Size',
          values: ['EU 30', 'EU 32', 'EU 34'],
        ),
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
      date: DateTime.now(),
    ),
    
    ProductModel(
      id: '005',
      title: 'Redmi 12C',
      stock: 10,
      price: 179.99,
      thumnail: 'assets/images/products/redmi_13c.png',
      productType: 'variable',
      brand: BrandModel(
        id: '4',
        image: 'assets/icons/brands/xiaomi.png',
        name: 'Xiaomi',
        isFeatured: true,
        productsCount: 50,
      ),
      categoryId: '6',
      description:
          'Xiaomi Redmi 13C Dual SIM 8GB Ram+256GB ROM (6.74 Inches) (4G)',
      isFeatured: true,
      salePrice: 10.0,
      sku: 'XR13C',
      images: [
        'assets/images/products/redmi_13c_1.png',
        'assets/images/products/redmi_13c_2.png',
      ],
      productAttributes: [
        ProductAttributesModel(
          name: 'Color',
          values: ['White', 'Black'],
        ),
      ],
      productVariations: [
        ProductVariationsModel(
          id: '1',
          stock: 10,
          price: 179.99,
          salePrice: 10.0,
          image: 'assets/images/products/redmi_13c_1.png',
          attributesValues: {
            'Color': 'Black',
          },
          description:
              'Xiaomi Redmi 13C Dual SIM 8GB Ram+256GB ROM (6.74 Inches) (4G)',
          sku: 'XR13CB',
        ),
      ],
      date: DateTime.now(),
    ),
    ProductModel(
      id: '006',
      title: 'Samsung Galaxy A15',
      stock: 10,
      price: 189.99,
      thumnail: 'assets/images/products/sga15w.png',
      productType: 'variable',
      description:
          'Samsung Galaxy A15 Dual SIM 6GB Ram+128GB ROM (6.5 Inches) (4G LTE) (Light Blue)',
      brand: BrandModel(
        id: '5',
        image: 'assets/icons/brands/samsung.png',
        name: 'Samsung',
        isFeatured: true,
        productsCount: 50,
      ),
      categoryId: '6',
      date: DateTime.now(),
      images: [
        'assets/images/products/sga15w.png',
        'assets/images/products/sga15b.png'
      ],
      isFeatured: true,
      salePrice: 20.0,
      sku: 'SGA15W',
      productAttributes: [
        ProductAttributesModel(
          name: 'Color',
          values: ['White', 'Black'],
        ),
      ],
      productVariations: [
        ProductVariationsModel(
          id: '1',
          stock: 10,
          price: 189.99,
          salePrice: 20.0,
          image: 'assets/images/products/sga15w.png',
          attributesValues: {
            'Color': 'White',
          },
          description:
              'Samsung Galaxy A15 Dual SIM 6GB Ram+128GB ROM (6.5 Inches) (4G LTE) (Light Blue)',
          sku: 'SGA15W',
        ),
        ProductVariationsModel(
          id: '2',
          stock: 10,
          price: 189.99,
          salePrice: 20.0,
          image: 'assets/images/products/sga15b.png',
          attributesValues: {
            'Color': 'Black',
          },
          description:
              'Samsung Galaxy A15 Dual SIM 6GB Ram+128GB ROM (6.5 Inches) (4G LTE) (Black)',
          sku: 'SGA15B',
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
    CategoryModel(
      id: '9',
      name: 'T-Shirts',
      image: XImages.clothes,
      isFeatured: true,
      parentId: '1',
    ),
    CategoryModel(
      id: '10',
      name: 'Mobiles',
      image: XImages.mobiles,
      isFeatured: true,
      parentId: '6',
    ),
  ];
}
