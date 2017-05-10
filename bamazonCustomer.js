var inquirer = require("inquirer");
var mysql = require("mysql");

var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'password',
    database: 'bamazon_db',
});

connection.connect();


//calls the order function
order();


function order() {
    connection.query("SELECT * FROM products", function(err, results) {
        if (err) throw err;

        inquirer.prompt([{
                name: "id",
                type: "input",
                message: "What is the id of the product you would like to buy?"
            }, {
                name: "units",
                type: "input",
                message: "How many units would you like?"
            }

        ]).then(function(answer) {
            var chosenItem;

            for (var i = 0; i < results.length; i++) {
                if (parseInt(results[i].item_id) === parseInt(answer.id)) {
                    chosenItem = results[i];

                }

            }


            // //determine if quantity is available
            if (chosenItem.stock_quantity >= answer.units) {
                //subtracts selected amount from original amount
                var newAmount = chosenItem.stock_quantity - answer.units;

                //Update database with mew amount
                connection.query("UPDATE products SET ? WHERE ?", [{
                    stock_quantity: newAmount
                }, {
                    item_id: parseInt(answer.id)
                }], function(err, res) {});

                //provide confirmation message to customer of successful purchase
                console.log("You have selected " + chosenItem.product_name + ", which is $" + chosenItem.price + " per unit.");
                console.log("Your total cost is $" + chosenItem.price * answer.units);
                ask();

                //if there aren't enough in stock, alert customer.
            } else if (chosenItem.stock_quantity < answer.units) {
                console.log("Sorry! Insufficient amount!")
                ask();
            }

        })
    });
};

//after a customer makes a purchase. The ask function will ask them
//if they would like to make another purchase and will
function ask() {

    inquirer.prompt([{
        name: "option",
        type: "input",
        message: "Would you like to make another purchase?"
    }]).then(function(answer) {
        //if user enters "yes"
        if (answer.option === "yes") {
            //allow another order
            order();
        } else {
            //else, send a good by message and end order process
            console.log("Have a Good Day!");
            process.exit();
        }

    })
}
