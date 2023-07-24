
# Flutter Product List App

This Flutter project is a simple product list app that displays a list of products from a JSON file. Users can view all products by default and also have the option to filter products by category. The app allows users to enter the quantity of each product, and upon submission, it displays the selected products and their quantities in a dialog box.


## Features

- Display a list of products from a JSON file.
- Filter products based on category (p_category).
- Allow users to enter the quantity for each product.
- Update the JSON data to include the quantity input.
- Show a visually appealing view with professional styling and effects.
- Display an image for each product, including a hardcoded image for visual appeal.
- Read the JSON data dynamically from an external file.

## ScreenShot

<img src="https://github.com/Pankaj0405/flutter_prac_json/assets/91046820/9eb6443d-3d95-406c-823a-be72c549106a" height="400" width="200">
<img src="https://github.com/Pankaj0405/flutter_prac_json/assets/91046820/c9705a56-a152-4f36-b977-0661ffc5f356" height="400" width="200">
<img src="https://github.com/Pankaj0405/flutter_prac_json/assets/91046820/b3047b30-286b-4a1f-8233-c46607605d25" height="400" width="200">
<img src="https://github.com/Pankaj0405/flutter_prac_json/assets/91046820/eaa0a194-5184-489a-ac55-3e7ef223acc7" height="400" width="200">

## JSON Data Format

The JSON data representing the products should have the following structure:

json

Copy code

[

  {

    "p_id": 1,
    "p_name": "Product 1",
    "p_category": "Category A",
    "p_price": 10.99,
    "p_image": "assets/images/product1.png"
  },

  {

    "p_id": 2,
    "p_name": "Product 2",
    "p_category": "Category B",
    "p_price": 15.49,
    "p_image": "assets/images/product2.png"
  },
  // Add more products here...
  
]
## Acknowledgements

- This project was inspired by the need to replicate the popular features of the Instagram app using Flutter and Firebase.
- Thanks to the open-source community for providing libraries and resources that made this project possible.

## License

This project is licensed under the MIT License.

