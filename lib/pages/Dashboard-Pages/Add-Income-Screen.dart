import 'package:flutter/material.dart';
import 'package:saver/pages/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart'; // Import for TextInputFormatter

class AmountDisplay extends StatelessWidget {
  final bool isIncome;
  final double amount;
  final TextEditingController amountController;

  AmountDisplay({
    required this.isIncome,
    required this.amount,
    required this.amountController,
  });

  @override
  Widget build(BuildContext context) {
    // Amount Values
    String sign = isIncome ? "+" : "-";
    Color signColor = isIncome ? Color(0xFF5BFF40) : Color(0xFF671E1E);

    return Container(
      width: 296,
      height: 62,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: accentColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text("PHP",
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  )),
          Container(
            width: 218,
            child: TextField(
              controller: amountController,
              textAlign: TextAlign.right,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+(\.\d{0,2})?$')),
              ],
              style: GoogleFonts.poppins(
                  color: signColor, fontSize: 27, fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                  hintText: "$sign${amount.toStringAsFixed(2)}",
                  hintStyle: GoogleFonts.poppins(
                      color: signColor,
                      fontSize: 27,
                      fontWeight: FontWeight.w600),
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}

class AddIncome extends StatefulWidget {
  const AddIncome({super.key});

  @override
  State<AddIncome> createState() => _AddIncomeState();
}

class _AddIncomeState extends State<AddIncome> {
  List<bool> isSelected = [true, false];
  //Amount Display Default Values
  bool isIncome = true;
  double amount = 0.00;
  TextEditingController amountController = TextEditingController();

  //Categories
  String? selectedIncomeCategory;
  String? selectedExpenseCategory;
  
  //Date and Time Picker
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  //Dropdown Items
  List<DropdownMenuItem<String>> incomeCategories = [
    DropdownMenuItem(child: Text("Salary"), value: "Salary"),
    DropdownMenuItem(child: Text("Allowance"), value: "Allowance"),
    DropdownMenuItem(child: Text("Others"), value: "Others"),
  ];

  List<DropdownMenuItem<String>> expenseCategories = [
    DropdownMenuItem(child: Text("Food"), value: "Food"),
    DropdownMenuItem(child: Text("Transportation"), value: "Transportation"),
    DropdownMenuItem(child: Text("Shopping"), value: "Shopping"),
    DropdownMenuItem(child: Text("Lodging"), value: "Lodging"),
    DropdownMenuItem(child: Text("Others"), value: "Others"),
  ];

  void handleCategoryChange(String? value) {
  setState(() {
    if (isIncome) {
      selectedIncomeCategory = value;
    } else {
      selectedExpenseCategory = value;
    }
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (){
              //navigation here
            }, 
            icon:const Icon(
              Icons.arrow_back,
            color: mainTextColor,)),
          const Spacer(),
          IconButton(
            onPressed: (){
              //navigation here
            }, 
            icon: const Icon(
              Icons.settings,
              color: mainTextColor,
              )),
        ],
      ),
      body: Container(
        color: bgColor,
        height: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          //Content here
          children: [
            //Edit and Delete Buttons
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //Edit Button
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: secondaryBtnColor,
                  ),
                  child: Center(
                    child: IconButton(onPressed: (){
                      //action here
                    },
                      icon: Icon(Icons.edit,
                      color: Color(0xFF404040),)),
                  ),
                ),
                SizedBox(width: 4),
                //Delete Button
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: secondaryBtnColor,
                  ),
                  child: Center(
                    child: IconButton(onPressed: (){
                      //action here
                    },
                      icon: Icon(Icons.delete,
                      color: Color(0xFF9C292A),)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            //Toggle Button Container
            Container(
              width: 328,
              height: 50,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: secondaryBtnColor,
                borderRadius: BorderRadius.circular(8)
              ),
              //Toggle Buttons
              child: ToggleButtons(
                borderRadius: BorderRadius.circular(4),
                isSelected: isSelected,
                color: mainTextColor,
                selectedColor: Colors.white,
                renderBorder: false,
                fillColor: accentColor,
                onPressed: (int index) {
                  setState(() {
                    isSelected = List.generate(2, (i) => i == index);
                    isIncome = index == 0;
                    if (isIncome) {
                      selectedIncomeCategory = null;
                    } else {
                      selectedExpenseCategory = null;
                    }
                  });
                },
                children: [
                  //Income Button
                  Container(
                      width: 159,
                      height: 42,
                      child: Center(
                        child: Text("Income",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: isSelected[0] ? Colors.white : mainTextColor
                          )),
                      ),
                  ),
                  //Expense Button
                  Container(
                      width: 159,
                      height: 42,
                      child: Center(
                        child: Text("Expense",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: isSelected[1] ? Colors.white : mainTextColor
                          )),
                      ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Container(
              width: 328,
              height: 296,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: secondaryBtnColor,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AmountDisplay(isIncome: isIncome, amount: amount, amountController: amountController),
                  const SizedBox(height: 10),
                  //Container for Category, Date and Time, and Label
                  Container(
                    width: 296,
                    height: 192,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0x3F549C8D),
                      borderRadius: BorderRadius.circular(4)
                    ),
                    child: Column(
                      children: [
                        //Category
                        Container(
                          width: 276,
                          height: 81,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Category",
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              SizedBox(height: 4),
                              //Dropdown for Category Here
                              Container(
                                width: 276,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: DropdownButton<String>(
                                    items: isIncome ? incomeCategories : expenseCategories, 
                                    value: isIncome ? selectedIncomeCategory : selectedExpenseCategory,
                                    onChanged: (newValue) {
                                      handleCategoryChange(newValue);
                                    },
                                    isExpanded: true,
                                    iconSize: 42.0,
                                    underline: SizedBox(),
                                    hint: Text("Required",
                                      style:  Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        color: Color(0xFF9C2829)
                                      )
                                    ),
                                    iconEnabledColor: primaryBtnColor,
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        //Date and Time
                        Container(
                          width: 276,
                          height: 81,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Date and Time",
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              SizedBox(height: 4),
                              // Date and Time Pickers
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () => _selectDate(context),
                                    child: Container(
                                      width: 144,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(Icons.calendar_today, color: primaryBtnColor),
                                          Text(
                                            selectedDate.toLocal().toString().split(' ')[0],
                                            style: Theme.of(context).textTheme.bodyMedium,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  InkWell(
                                    onTap: () => _selectTime(context),
                                    child: Container(
                                      width: 128,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(Icons.access_time, color: primaryBtnColor),
                                          Text(
                                            selectedTime.format(context),
                                            style: Theme.of(context).textTheme.bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            //Buttons
            Container(
              width: 328,
              height: 106,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 328,
                    height: 47,
                    decoration: BoxDecoration(
                      color: primaryBtnColor,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: ElevatedButton(
                      onPressed: (){
                        //Navigation Here
                      }, 
                      style: ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
                        backgroundColor: MaterialStatePropertyAll(primaryBtnColor),
                        elevation: MaterialStatePropertyAll(0),
                      ),
                      child: Text(
                        isIncome? "Add Income" : "Add Expense",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white
                        ),
                      ),
                    )
                  ),
                  SizedBox(height: 12),
                  Container(
                    width: 328,
                    height: 47,
                    decoration: BoxDecoration(
                      color: primaryBtnColor,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: ElevatedButton(
                      onPressed: (){
                        //Navigation Here
                      }, 
                      style: ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
                        backgroundColor: MaterialStatePropertyAll(secondaryBtnColor),
                        elevation: MaterialStatePropertyAll(0),
                      ),
                      child: Text(
                        "Cancel",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}