import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    Page2(),
    Page3(),
    Page4(),
    Page5(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FinVeda'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.purple,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Arbitrage',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.percent),
            label: 'Charges',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Share pulling',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> stockNames = [
    'Reliance',
    'Tata Motors',
    'Infosys',
    'HDFC Bank',
    'ITC',
    'ICICI Bank',
    'Hindustan Unilever',
    'TCS',
    'Axis Bank',
    'Larsen & Toubro',
    'Bharti Airtel',
    'Nestle India',
    'Maruti Suzuki',
    'Wipro',
    'Asian Paints',
    'HDFC',
    'Kotak Mahindra Bank',
    'Sun Pharma',
    'NTPC',
    'Power Grid',
  ];

  final List<double> stockPrices = [
    2345.67,
    455.80,
    1576.90,
    1267.45,
    213.50,
    625.30,
    2318.75,
    3579.20,
    702.55,
    1515.25,
    659.40,
    18195.35,
    7273.15,
    384.90,
    3347.55,
    2664.90,
    2087.75,
    786.60,
    127.80,
    240.35,
  ];

  final List<Color> buttonColors = [
    Colors.orange,
    Colors.green,
    Colors.blue,
    Colors.red,
  ];

  final Random random = Random();

  Color getRandomColor() {
    return buttonColors[random.nextInt(buttonColors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Holdings:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    stockNames.length,
                        (index) {
                      return ActionButton(
                        name: stockNames[index],
                        price: stockPrices[index],
                        color: getRandomColor(),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String name;
  final double price;
  final Color color;

  const ActionButton({
    required this.name,
    required this.price,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StockPage(name: name, price: price),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            Expanded(
              child: Text(
                '\$${price.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            SizedBox(width: 8.0),
            IconButton(
              icon: Icon(Icons.sell),
              color: Colors.white,
              onPressed: () {
                // Perform sell action
                print('Sell $name');
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Colors.white,
              onPressed: () {
                // Perform buy action
                print('Buy $name');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class StockPage extends StatelessWidget {
  final String name;
  final double price;

  const StockPage({required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: $name',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Price: \$${price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              height: 200.0,
              width: double.infinity,
              color: Colors.grey[300],
              child: Center(
                child: Text(
                  'Random Graph',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Perform sell action
                print('Sell $name');

              },
              child: Text('Sell'),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                // Perform buy action
                print('Buy $name');
              },
              child: Text('Buy'),
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arbitrage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Arbitrage Page',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                children: [
                  ArbitrageItem(
                    stockName: 'Tata Consultancy Services',
                    buyPrice: 3100.0,
                    sellPrice: 3150.0,
                  ),
                  ArbitrageItem(
                    stockName: 'Reliance Industries',
                    buyPrice: 2500.0,
                    sellPrice: 2550.0,
                  ),
                  ArbitrageItem(
                    stockName: 'HDFC Bank',
                    buyPrice: 1200.0,
                    sellPrice: 1250.0,
                  ),
                  ArbitrageItem(
                    stockName: 'Infosys',
                    buyPrice: 1700.0,
                    sellPrice: 1750.0,
                  ),
                  ArbitrageItem(
                    stockName: 'ICICI Bank',
                    buyPrice: 650.0,
                    sellPrice: 700.0,
                  ),
                  ArbitrageItem(
                    stockName: 'Axis Bank',
                    buyPrice: 700.0,
                    sellPrice: 750.0,
                  ),
                  // Add more ArbitrageItem widgets for other stocks
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArbitrageItem extends StatelessWidget {
  final String stockName;
  final double buyPrice;
  final double sellPrice;

  const ArbitrageItem({
    required this.stockName,
    required this.buyPrice,
    required this.sellPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(stockName),
        subtitle: Row(
          children: [
            Text('Buy: \$${buyPrice.toStringAsFixed(2)}'),
            SizedBox(width: 8.0),
            Text('Sell: \$${sellPrice.toStringAsFixed(2)}'),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArbitrageDetailsPage(
                  stockName: stockName,
                  buyPrice: buyPrice,
                  sellPrice: sellPrice,
                ),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.purpleAccent,
          ),
          child: Text('Arbitrage'),
        ),
      ),
    );
  }
}

class ArbitrageDetailsPage extends StatelessWidget {
  final String stockName;
  final double buyPrice;
  final double sellPrice;

  const ArbitrageDetailsPage({
    required this.stockName,
    required this.buyPrice,
    required this.sellPrice,
  });

  @override
  Widget build(BuildContext context) {
    double difference = sellPrice - buyPrice;

    return Scaffold(
      appBar: AppBar(
        title: Text('Arbitrage Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              stockName,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Buy Price: \$${buyPrice.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Sell Price: \$${sellPrice.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Difference: \$${difference.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Perform buy action
                    print('Buy: $stockName');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  child: Text('Buy'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Perform sell action
                    print('Sell: $stockName');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  child: Text('Sell'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



class Page3 extends StatelessWidget {
  final Random _random = Random();

  List<BrokerageCompany> _getBrokerageCompanies() {
    return [
      BrokerageCompany(
        name: 'Zerodha',
        brokerageFees: '0.03% or ₹20 per executed order',
        discountCodes: ['XYZCODE', 'ABCOFFER'],
        amountSpent: _random.nextDouble() * 500000,
      ),
      BrokerageCompany(
        name: 'Groww',
        brokerageFees: 'No Brokerage',
        discountCodes: ['GROWW500', 'INVEST100'],
        amountSpent: _random.nextDouble() * 500000,
      ),
      BrokerageCompany(
        name: 'Upstox',
        brokerageFees: '₹20 per executed order',
        discountCodes: ['UPSTOX100', 'DEAL50'],
        amountSpent: _random.nextDouble() * 500000,
      ),
      BrokerageCompany(
        name: 'WazirX',
        brokerageFees: '0.2% or ₹20 per executed order',
        discountCodes: ['WAZIRX200', 'TRADE50'],
        amountSpent: _random.nextDouble() * 500000,
      ),
      // Add more brokerage companies here
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<BrokerageCompany> brokerageCompanies = _getBrokerageCompanies();
    return Scaffold(
      appBar: AppBar(
        title: Text('Tax and charges reduction'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: brokerageCompanies.length,
        itemBuilder: (context, index) {
          BrokerageCompany company = brokerageCompanies[index];
          double spentPercentage = company.amountSpent / 500000;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  company.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.money),
                title: Text('Brokerage Fees'),
                subtitle: Text(company.brokerageFees),
              ),
              ListTile(
                leading: Icon(Icons.card_giftcard),
                title: Text('Discount and Coupon Codes'),
                subtitle: Text(company.discountCodes.join(', ')),
              ),
              ListTile(
                title: Text(
                  'Amount Spent',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
              LinearProgressIndicator(
                value: spentPercentage,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  '₹${company.amountSpent.toStringAsFixed(2)}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class BrokerageCompany {
  final String name;
  final String brokerageFees;
  final List<String> discountCodes;
  final double amountSpent;

  BrokerageCompany({
    required this.name,
    required this.brokerageFees,
    required this.discountCodes,
    required this.amountSpent,
  });
}



class Page4 extends StatelessWidget {
  final List<Investor> investors = [
    Investor(
      name: 'Rajesh Gupta',
      investments: [
        Investment(company: 'Tata Motors', investedAmount: 10000, profit: 500),
        Investment(company: 'Reliance Industries', investedAmount: 15000, profit: 1000),
        Investment(company: 'HDFC Bank', investedAmount: 20000, profit: 2500),
        Investment(company: 'ITC Limited', investedAmount: 18000, profit: 1500),
      ],
    ),
    Investor(
      name: 'Anita Verma',
      investments: [
        Investment(company: 'Infosys', investedAmount: 12000, profit: 800),
        Investment(company: 'Hindustan Unilever', investedAmount: 18000, profit: 1500),
        Investment(company: 'ITC Limited', investedAmount: 22000, profit: 3000),
        Investment(company: 'Tata Steel', investedAmount: 14000, profit: 1200),
        Investment(company: 'Asian Paints', investedAmount: 20000, profit: 1800),
      ],
    ),
    Investor(
      name: 'Sanjay Sharma',
      investments: [
        Investment(company: 'ICICI Bank', investedAmount: 16000, profit: 1200),
        Investment(company: 'Maruti Suzuki', investedAmount: 25000, profit: 2000),
        Investment(company: 'Larsen & Toubro', investedAmount: 22000, profit: 1800),
        Investment(company: 'Bharti Airtel', investedAmount: 18000, profit: 1500),
        Investment(company: 'Axis Bank', investedAmount: 20000, profit: 1600),
      ],
    ),
    // Add more investors here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Portfolio'),
      ),
      body: ListView.builder(
        itemCount: investors.length,
        itemBuilder: (context, index) {
          final investor = investors[index];
          return InvestorPortfolioCard(investor: investor);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle the invest button action
          // Navigate to the investment screen or perform any other action
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Investor {
  final String name;
  final List<Investment> investments;

  Investor({required this.name, required this.investments});
}

class Investment {
  final String company;
  final double investedAmount;
  final double profit;

  Investment({required this.company, required this.investedAmount, required this.profit});
}

class InvestorPortfolioCard extends StatelessWidget {
  final Investor investor;

  InvestorPortfolioCard({required this.investor});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              investor.name,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: investor.investments.length,
            itemBuilder: (context, index) {
              final investment = investor.investments[index];
              return ListTile(
                title: Text(investment.company),
                subtitle: Text('Invested Amount: ₹${investment.investedAmount.toStringAsFixed(2)}'),
                trailing: Text('Profit: ₹${investment.profit.toStringAsFixed(2)}'),
              );
            },
          ),
          SizedBox(height: 16.0),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Handle the invest button action
                // Navigate to the investment screen or perform any other action
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              child: Text('Invest in Stocks'),
            ),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}


class Page5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Profile'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text(
              'Account Information',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Username'),
            subtitle: Text('John Doe'),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // Implement edit username functionality
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Mobile Number'),
            subtitle: Text('+1 1234567890'),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // Implement edit mobile number functionality
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('Bank Details'),
            subtitle: Text('XYZ Bank - XXXXXXXX'),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // Implement edit bank details functionality
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('History'),
            onTap: () {
              // Implement history functionality
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text('Wallets'),
            onTap: () {
              // Implement wallets functionality
            },
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Reports'),
            onTap: () {
              // Implement reports functionality
            },
          ),
          ListTile(
            title: Text(
              'App Settings',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () {
              // Implement notifications functionality
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Implement settings functionality
            },
          ),
          ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text('Refer and Earn'),
            onTap: () {
              // Implement refer and earn functionality
            },
          ),
          ListTile(
            title: Text(
              'Join the Community',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('Telegram Channel'),
            onTap: () {
              // Implement Telegram channel functionality
            },
          ),
          ListTile(
            leading: Icon(Icons.photo_camera),
            title: Text('Instagram Page'),
            onTap: () {
              // Implement Instagram page functionality
            },
          ),
          ListTile(
            leading: Icon(Icons.play_circle_filled),
            title: Text('YouTube Channel'),
            onTap: () {
              // Implement YouTube channel functionality
            },
          ),
        ],
      ),
    );
  }
}
