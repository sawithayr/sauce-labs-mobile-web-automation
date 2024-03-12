# sauce-labs-mobile-web-automation
Hello, this is my first project for swiftUI automation. In this project i'm using Sauce labs (https://www.saucedemo.com/) for the automation and POM for the project stucture

Environtment : Xcode Version 15.2

Step to run the testcase :
1. Make sure you are installed Xcode
2. clone this project
3. open the `SafariSauceLabsUITests.swift` file in your xcode
4. click the `Run` icon in the left side of `func`
5. it will install and run your simulator


TestCase 1
1. login with username: **standard_user** and password: secret_sauce
2. in homepage, scroll down to product Sauce Labs Onesie
3. click add to cart
4. go to Cart detail page
5. click continue payment
6. Filling the first name, last name, and postal code
7. click finish payment
8. verify the success purchase product is visible

link video : https://drive.google.com/file/d/1MuHVbys-3t8iSVNZVubgQWK2sQpCC7RM/view?usp=drive_link

Testcase 2
1. login with username: **performance_glitch_user** and password: secret_sauce
2. wait homepage to load
3. in homepage, click filter and select the filter Price (low to high)
5. click add to cart the cheapest product
6. wait the page to load
7. go to Cart detail page
8. click continue payment
9. Filling the first name, last name, and postal code
10. click finish payment
11. 6. wait the page to load
12. verify the success purchase product is visible

link video : https://drive.google.com/file/d/1FlQd8hqFm7rJFvPF6f5C4j3mgpuLQvWP/view?usp=sharing

Testcase 3 (expected to fail)
1. login with username: **locked_out_user** and password: secret_sauce
2. validate fail login and terminate the safari
3. relaunch the safari
4. login with username: **problem_user** and password: secret_sauce
5. in homepage, click filter and select the filter Price (high to low)
6. click add to cart for the first item
7. go to Cart detail page
8. click continue payment
9. Filling the first name, last name, and postal code // Testcase will failed in this step
10. click finish payment
11. verify the success purchase product is visible

link video : https://drive.google.com/file/d/12GLqxHyKZYOV3d8z-N_eC5Z20hgUTTM2/view?usp=sharing
