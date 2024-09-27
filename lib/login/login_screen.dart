import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retos/login/input_decoration.dart';
import 'package:retos/providers/usuario_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Mueve los controladores a la clase State para que se mantengan durante el ciclo de vida del widget
  final TextEditingController _txtUsername = TextEditingController();
  final TextEditingController _txtPassword = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    // Asegúrate de liberar los controladores cuando el widget se destruya
    _txtUsername.dispose();
    _txtPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      body: SizedBox(
        //Ancho y alto maximo
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [cajaSuperior(size), logo(), cajaLogin(context)],
        ),
      ),
    );
  }

  //SingleChildScrollView Para hacer flotante la caja y no interfiera con el teclado
  SingleChildScrollView cajaLogin(BuildContext context) {
    //Para obtener la lista de los usuarios
    final usuaroProvider = Provider.of<Usuario_provider>(context);
    
    /*TextEditingController  _txtUsername = TextEditingController();
    TextEditingController  _txtPassword = TextEditingController();*/
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 250),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15,
                    offset: Offset(0, 5),
                  )
                ]),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Text('Login',
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _txtUsername,
                            autocorrect: false,
                            //Para que en el teclado aparezca el @ keyboardType: TextInputType.emailAddress,
                            keyboardType: TextInputType.number,
                            //Llamamos a la clase y le pasamos los parametros
                            decoration: InputDecorations.inputDecoration(
                              hintText: '',
                              labelText: 'Usuario',
                              icono: const Icon(Icons.supervised_user_circle),
                            ),
                            validator: (value) {
                              return (value != null && value.length == 8)
                                  ? null
                                  : 'El codigo de usuario debe ser igual a 8 caracteres';
                            },
                            /* VALIDACION PARA CORREO
                                validator: (value) {
                                  String pattern =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                  RegExp regExp = new RegExp(pattern);
                                  //Si el value me devuelve una cadena vacia esta todo bien sino mando el mesaje
                                  return regExp.hasMatch(value ?? '')? null: 
                                    'El valor ingresado no es un correo';
                                },*/
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            autocorrect: false,
                            obscureText: _obscureText,
                            decoration: InputDecorations.inputDecoration(
                              hintText: '',
                              labelText: 'Contraseña',
                              icono: const Icon(Icons.lock_outline),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText ? Icons.visibility_off : Icons.visibility,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText; // Cambia el estado al presionar
                                  });
                                },
                              ),
                            ),
                            validator: (value) {
                              return (value != null && value.length > 5)
                                  ? null
                                  : 'La contraseña debe ser mayor a 5 caracteres';
                            },
                            controller: _txtPassword,
                          ),
                          const SizedBox(
                            height: 30
                          ),
                          MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              disabledColor: Colors.blueGrey,
                              color: Colors.grey,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 80, vertical: 15),
                                child: const Text(
                                  'Ingresar',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              onPressed: () {
                                var usuarios = usuaroProvider.usuario;
                                if (usuarios.where((e)=>e.username==_txtUsername.text).length>0&& 
                                    usuarios.where((e)=>e.password == _txtPassword.text).length>0){
                                      Navigator.pushReplacementNamed(context, 'home');
                                } else {
                                  final snackbar = SnackBar(
                                    content: Text(
                                        'El usuario o contraseña son incorrectos'),
                                    duration: Duration(seconds: 2),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackbar);
                                }
                              })
                        ],
                      )),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text('Crear una nueva cuenta',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Container cajaSuperior(Size size) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 12, 12, 11),
        Color.fromRGBO(84, 88, 83, 1),
      ])),
      width: double.infinity,
      height: size.height * 0.4,
    );
  }

  SafeArea logo() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        width: double.infinity,
        child: const Icon(
          Icons.person_pin,
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
