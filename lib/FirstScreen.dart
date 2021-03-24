
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class FirstScreen extends StatefulWidget { //Обернув всю сторінку в StatefulWidget, щоб відрисовувати змінні на сторінці з товарами
  @override                               //Це є трохи не правильним, але наразі зробив це так.
  createState() => FirstScreenState();
}


class FirstScreenState extends State<FirstScreen> {
  var arr = [];       //Створив пустий массив для збереження обєктів товарів, які мають свої ключи та значення.

  TextEditingController codeController = new TextEditingController(); //Створив контролєри для відслідковування змін в формах вводу інформації
  TextEditingController descriptionController = new TextEditingController();
  TextEditingController commentController = new TextEditingController();

  bool _isVisible = false; // Створив булеву змінну, для твідображення певного блоку при натиску кнокпи

  bool _isVisibleComment = false; // Створив булеву змінну, для твідображення певного блоку при натиску кнокпи

  String comment = ''; //Створив строкову зміну для одноразового збереження коментаря
  //Коментарі слід було закинути в обект товару "tovar", під новим масивов коментарів commets = [коментар 1, ком. 2 ...]
  //А потім при натиску на певну карточку товару діставати код тавара з візуальної частини наприклад "23234234"
  //І проходитись по массиву та шукати обьект з ключем code і зрівнювати значення. Якщо одинакове то відобразити його масив коментарів,
  // якщо ні то перейти до наступного обекта

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Товари",
        home: Scaffold( //
          appBar: AppBar(
            title: Text("Товари"),
            centerTitle: true, //відцентрувати по центру
            backgroundColor: Colors.black,
          ),
          body: Column( //схожий на логіку флекса в css
            children: [
              Stack(// Для абсолютного позицінування
                children: [
                  Visibility( //Віджет для відображення блоку
                    visible: _isVisibleComment, //Якщо значення зміної змінюється, то відповідно змінюється стан блока
                    child: Container(
                      margin: EdgeInsets.fromLTRB(60, 10, 60, 10),
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.yellow[200]),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  iconSize: 20,
                                  icon: Icon(Icons.close),
                                  onPressed: () => setState(() {
                                    _isVisibleComment = !_isVisibleComment; //Перемикаємо відображення блока
                                    commentController.text = '';//Чистим поля вводу
                                    comment = '';
                                  })),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '$comment',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          SizedBox( //Використовував для відступів між блоками
                            height: 20,
                          ),
                          TextField( //Форма для зброру данних, що ввів користувач
                            controller: commentController, //Приєдную контролер для слідкування станом форми і данних введених в ній
                            decoration: InputDecoration(
                              hintText: 'Коментар до товару',
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                            ),
                            maxLines: 2,
                          ),
                          IconButton(
                              alignment: Alignment.topRight,
                              icon: Icon(Icons.add),
                              onPressed: () => setState(() {
                                comment = commentController.text; //Записую коментар який ввів користувач в змінну
                                commentController.text = ''; //Очистити форму після натиску на кнопку
                              })),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(80, 20, 80, 20),
                child: Visibility(
                  visible: _isVisible, //Якщо значення зміної змінюється, то відповідно змінюється стан блока
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                alignment: Alignment.topRight,
                                icon: Icon(Icons.close),
                                onPressed: () => setState(() {
                                  _isVisible = !_isVisible;
                                })),
                          ],
                        ),
                        TextField( //Форма для шрихкодів
                          controller: codeController, //Приєдную контролер для слідкування станом форми і данних введених в ній
                          decoration: InputDecoration(
                            hintText: '224322345223',
                            labelText: 'Штрих-код:',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          maxLength: 12,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField( //Форма для товару
                          controller: descriptionController,
                          decoration: InputDecoration(
                            hintText: 'Молоко, "Молокія", 2%',
                            labelText: 'Опис товару:',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(),
                          ),
                          maxLength: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                                iconSize: 35,
                                icon: Icon(Icons.add_circle_outline),
                                onPressed: () => setState(() {  //Головна фунція яка записує данні які ввів користувач
                                  if (codeController.text.length > 1 &&
                                      descriptionController.text.length >
                                          1) { //Поля не можуть бути пусті
                                    var tovar = <String, String>{   //Створємо обьєкт який зберігає в себе данні про товар
                                      'code': '${codeController.text}',
                                      'description':
                                      '${descriptionController.text}',
                                      'comment': '${commentController.text}',
                                    };
                                    arr.add(tovar);//Додаємо цей обект в массив який ми визначили на самому початку
                                    codeController.text = ''; //Чистимо поля після вводу
                                    descriptionController.text = ''; //Чистимо поля після вводу
                                  }
                                  _isVisible = !_isVisible; //Перемикач, закриває вікно з формами після натиску на кнопку "додати"
                                })),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded( // для заповнення пустого місця
                child: Container(
                  child: ListView.builder( //Для відображення списка товарів, і для створення нових товарів
                    padding: EdgeInsets.all(10), //Відступи
                    itemCount: arr.length, //Крайня точна довжина масива
                    itemBuilder: (_, index) => Card( //Функция вертає віджет
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: ListTile(
                          title: Text(
                            'Штрих-код:',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                arr[index]['code'], //Берем значення ключа 'code' із массиву arr та обьекта по номеру індекса
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                arr[index]['description'], //Берем значення ключа 'description' із массиву arr та обьекта по номеру індекса
                                style: TextStyle(
                                    fontSize: 18, color: Colors.red[200]),
                              ),
                            ],
                          ),
                          onTap: () => setState(() {
                            _isVisibleComment = !_isVisibleComment; //При натискані на кнопку міняємо відображення форми
                            _isVisible = false; //Також ховаєм блок, що б не можна було одночасно відкрити і блок коментарів та блок додання товару
                            comment = ''; //Чистим значення коментаря
                          }),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Text(
              '+',
              style: TextStyle(color: Colors.black, fontSize: 35),
            ),
            backgroundColor: Colors.green,
            onPressed: () {
              setState(() {
                _isVisible = !_isVisible; //При натискані на кнопку міняємо відображення форми
                _isVisibleComment = false; //Також ховаєм блок, що б не можна було одночасно відкрити і блок коментарів та блок додання товару
              });
            },
          ),
        ));
  }
}

