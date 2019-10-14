//
//  ViewController.swift
//  collections
//
//  Created by 2020-1 on 9/18/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{

    @IBOutlet weak var coleccion: UICollectionView!
    @IBOutlet weak var totalCompra: UILabel!
    
    var total: Int = 0
    
    var sala01 = Sala(id: "01", cupo_max: 15)
    var sala02 = Sala(id: "02", cupo_max: 15)
    var sala03 = Sala(id: "03", cupo_max: 15)
    var sala04 = Sala(id: "04", cupo_max: 15)
    var sala05 = Sala(id: "05", cupo_max: 15)
    
    lazy var peliculas = [pelicula00, pelicula01, pelicula02, pelicula03, pelicula04, pelicula05, pelicula06, pelicula07, pelicula08, pelicula09, pelicula10]
    
    lazy var funcion_00_0 = Funcion(sala: sala01, hora_inicio: "10:00", hora_fin: "12:00", cupo_disp: 15, precio: 70)
    lazy var funcion_01_0 = Funcion(sala: sala01, hora_inicio: "12:30", hora_fin: "14:30", cupo_disp: 15, precio: 70)

    lazy var funcion_02_0 = Funcion(sala: sala02, hora_inicio: "10:00", hora_fin: "12:00", cupo_disp: 15, precio: 70)
    lazy var funcion_03_0 = Funcion(sala: sala02, hora_inicio: "12:30", hora_fin: "14:30", cupo_disp: 15, precio: 70)

    lazy var funcion_04_0 = Funcion(sala: sala03, hora_inicio: "10:00", hora_fin: "12:00", cupo_disp: 15, precio: 70)
    lazy var funcion_05_0 = Funcion(sala: sala03, hora_inicio: "12:30", hora_fin: "14:30", cupo_disp: 15, precio: 70)

    lazy var funcion_06_0 = Funcion(sala: sala04, hora_inicio: "10:00", hora_fin: "12:00", cupo_disp: 15, precio: 70)
    lazy var funcion_07_0 = Funcion(sala: sala04, hora_inicio: "12:30", hora_fin: "14:30", cupo_disp: 15, precio: 70)

    lazy var funcion_08_0 = Funcion(sala: sala05, hora_inicio: "10:00", hora_fin: "12:00", cupo_disp: 15, precio: 70)
    lazy var funcion_09_0 = Funcion(sala: sala05, hora_inicio: "12:30", hora_fin: "14:30", cupo_disp: 15, precio: 70)

    lazy var funcion_10_0 = Funcion(sala: sala01, hora_inicio: "15:00", hora_fin: "17:00", cupo_disp: 15, precio: 70)
    lazy var funcion_00_1 = Funcion(sala: sala01, hora_inicio: "17:30", hora_fin: "19:30", cupo_disp: 15, precio: 70)

    lazy var funcion_01_1 = Funcion(sala: sala02, hora_inicio: "15:00", hora_fin: "17:00", cupo_disp: 15, precio: 70)
    lazy var funcion_02_1 = Funcion(sala: sala02, hora_inicio: "17:30", hora_fin: "19:30", cupo_disp: 15, precio: 70)

    lazy var funcion_03_1 = Funcion(sala: sala03, hora_inicio: "15:00", hora_fin: "17:00", cupo_disp: 15, precio: 70)
    lazy var funcion_04_1 = Funcion(sala: sala03, hora_inicio: "17:30", hora_fin: "19:30", cupo_disp: 15, precio: 70)

    lazy var funcion_05_1 = Funcion(sala: sala04, hora_inicio: "15:00", hora_fin: "17:00", cupo_disp: 15, precio: 70)
    lazy var funcion_06_1 = Funcion(sala: sala04, hora_inicio: "17:30", hora_fin: "19:30", cupo_disp: 15, precio: 70)

    lazy var funcion_07_1 = Funcion(sala: sala05, hora_inicio: "15:00", hora_fin: "17:00", cupo_disp: 15, precio: 70)
    lazy var funcion_08_1 = Funcion(sala: sala05, hora_inicio: "17:30", hora_fin: "19:30", cupo_disp: 15, precio: 70)

    lazy var funcion_09_1 = Funcion(sala: sala01, hora_inicio: "20:00", hora_fin: "22:00", cupo_disp: 15, precio: 70)
    lazy var funcion_10_1 = Funcion(sala: sala02, hora_inicio: "20:00", hora_fin: "22:00", cupo_disp: 15, precio: 70)
    
    lazy var funcion_00_2 = Funcion(sala: sala03, hora_inicio: "20:00", hora_fin: "22:00", cupo_disp: 15, precio: 70)
    lazy var funcion_00_3 = Funcion(sala: sala04, hora_inicio: "20:00", hora_fin: "22:00", cupo_disp: 15, precio: 70)

    
    

    lazy var pelicula00 = Pelicula(
                        poster: UIImage(named: "alien")!,
                        titulo: "Alien",
                        clasificacion: "B15",
                        duracion: 116,
                        director: "Ridley Scot",
                        reparto: "Sigourney Weaver, John Hurt, Yaphet Kotto, Tom Skerritt, Veronica Cartwright, Harry Dean Stanton, Ian Holm",
                        sinopsis: "De regreso a la Tierra, la nave de carga Nostromo interrumpe su viaje y despierta a sus siete tripulantes. El ordenador central, MADRE, ha detectado la misteriosa transmisión de una forma de vida desconocida, procedente de un planeta cercano aparentemente deshabitado. La nave se dirige entonces al extraño planeta para investigar el origen de la comunicación." ,
                        genero: "Ciencia Ficción/Terror",
                        valoracion: 4.5,
                        funciones: [funcion_00_0, funcion_00_1, funcion_00_2, funcion_00_3])

    lazy var pelicula01 = Pelicula(
                        poster: UIImage(named: "batman")!,
                        titulo: "Batman",
                        clasificacion: "B15",
                        duracion: 121,
                        director: "Tim Burton",
                        reparto: "Michael Keaton, Jack Nicholson, Kim Basinger, Robert Wuhl, Pat Hingle",
                        sinopsis: "Cinta basada en el cómic homónimo. La oscura y peligrosa ciudad de Gotham tan solo se halla protegida por su corrupto cuerpo de policía. A pesar de los esfuerzos del fiscal del distrito Harvey Dent y el comisionado de policÌa Jim Gordon, la ciudad es cada vez más insegura hasta que aparece Batman, el Señor de la Noche. La reputada periodista Vicky Vale intentar· descubrir el secreto que se oculta tras el hombre murciélago." ,
                        genero: "Acción/Thriller/Superhéroes",
                        valoracion: 4.0,
                        funciones: [funcion_01_0, funcion_01_1])

    lazy var pelicula02 = Pelicula(
                        poster: UIImage(named: "beetlejuice")!,
                        titulo: "Beetlejuice",
                        clasificacion: "B15",
                        duracion: 93,
                        director: "Tim Burton",
                        reparto: "Michael Keaton, Alec Baldwin, Geena Davis, Winona Ryder, Jeffrey Jones, Sylvia Sidney, Glenn Shadix, Catherine O'Hara",
                        sinopsis: "Un matrimonio de fantasmas (Geena Davis y Alec Baldwin) contrata los servicios de Bitelchus (Michael Keaton), un especialista en asustar mortales, para que ahuyente a los nuevos propietarios de su querida casa Victoriana." ,
                        genero: "Fantasía/Comedia",
                        valoracion: 4.0,
                        funciones: [funcion_02_0, funcion_02_1])

    lazy var pelicula03 = Pelicula(
                        poster: UIImage(named: "bttf2")!,
                        titulo: "Back to the Future. Part II",
                        clasificacion: "B15",
                        duracion: 93,
                        director: "Robert Zemeckis",
                        reparto: "Michael J. Fox, Christopher Lloyd, Lea Thompson, Thomas F. Wilson, Elisabeth Shue, Charles Fleischer, Joe Flaherty, Harry Waters Jr.",
                        sinopsis: "Aunque a Marty McFly todavía le falta tiempo para asimilar el hecho de estar viviendo dentro de la familia perfecta gracias a su anterior viaje en el tiempo, no le queda ni espacio para respirar cuando su amigo Doc aparece de improviso con la máquina del tiempo (mucho más modernizada), e insta a que le acompañen él y su novia a viajar al futuro para solucionar un problema con la ley que tendrá uno de sus futuros hijos. En la tremenda vorágine futurista, con todo lo que ello conlleva, del Hill Valley de 2015, la presencia de tales viajeros temporales causará un efecto mayor que el que iban a arreglar. Un almanaque deportivo y la posesión del secreto de la existencia de la máquina del tiempo por parte del siempre villano Biff Tannen, serán los ingredientes que conjugarán una causa-efecto en el pasado, en el presente y en el propio futuro, que hará que Marty y Doc se tengan que emplear a fondo para poner fin a la cat·átrofe a la que les lleva el destino." ,
                        genero: "Aventura/Ciencia Ficción/Comedia",
                        valoracion: 4.5,
                        funciones: [funcion_03_0, funcion_03_1])

    lazy var pelicula04 = Pelicula(
                        poster: UIImage(named: "fly")!,
                        titulo: "The Fly",
                        clasificacion: "B15",
                        duracion: 100,
                        director: "David Cronenberg",
                        reparto: "Jeff Goldblum, Geena Davis, John Getz, Joy Boushel, Leslie Carlson, George Chuvalo, Michael Copeman, David Cronenberg, Carol Lazare, Shawn Hewitt",
                        sinopsis: "Un científico se utiliza a sí mismo como cobaya en la realización de un complejo experimento de teletransportación. La prueba es un éxito, pero empieza a sufrir unos extraños cambios en su cuerpo. Al mismo tiempo, descubre que dentro de la cápsula donde realizó el experimento con él se introdujo una mosca." ,
                        genero: "Ciencia Ficción/Terror",
                        valoracion: 5.0,
                        funciones: [funcion_04_0, funcion_04_1])

    lazy var pelicula05 = Pelicula(
                        poster: UIImage(named: "friday_the_thirteenth_viii")!,
                        titulo: "Friday the 13th, Part VIII: Jason Takes Manhattan",
                        clasificacion: "B15",
                        duracion: 100,
                        director: "Rob Hedden",
                        reparto: "JKane Hodder, Todd Shaffer, Tiffany Paulsen, Tim Mirkovich, Jensen Daggett, Barbara Bingham, Alex Diakun, Peter Mark Richman, Warren Munson, Kelly Hu",
                        sinopsis: "Jason ha escogido como víctimas a un grupo de escolares que se encuentra en Crystal Lake. Tras una primera masacre, decide ir a Manhattan para acabar con los supervivientes de su primera embestida." ,
                        genero: "Slasher/Terror",
                        valoracion: 2.5,
                        funciones: [funcion_05_0, funcion_05_1])

    lazy var pelicula06 = Pelicula(
                        poster: UIImage(named: "heathers")!,
                        titulo: "Heathers",
                        clasificacion: "B15",
                        duracion: 110,
                        director: "Michael Lehmann",
                        reparto: "Winona Ryder, Christian Slater, Kim Walker, Lisanne Falk, Shannen Doherty, Penelope Milford",
                        sinopsis: "Un grupo de cuatro jóvenes de una preparatoria consideradas como las más populares, cometen todo tipo de crueldades con sus compañeros. Una de estas chicas, Verónica Sawyer (Winona Ryder), empieza a darse cuenta de que lo que hacen no es bueno, pero le resulta difícil salir del grupo. Aliada con un nuevo chico que ha llegado a la escuela, logran matar a tres alumnos molestos, aunque en todos los casos aparecen como suicidas. Pronto Verónica se dará cuenta de que su amigo es un psicóp" ,
                        genero: "Comedia/Drama",
                        valoracion: 3.5,
                        funciones: [funcion_06_0, funcion_06_1])

    lazy var pelicula07 = Pelicula(
                        poster: UIImage(named: "honey_i_shrunk_the_kids")!,
                        titulo: "Honey, I Shrunk the Kids",
                        clasificacion: "B15",
                        duracion: 110,
                        director: "Joe Johnston",
                        reparto: "Rick Moranis, Matt Frewer, Marcia Strassman, Kristine Sutherland, Thomas Wilson Brown, Jared Rushton, Amy O'Neill, Robert Oliveri, Carl Steven, Mark L. Taylor, Kimmy Robertson",
                        sinopsis: "Wayne Szalinski es un científico e inventor que desarrolla una máquina que permite encoger el tamaño de los objetos. Una pelota de béisbol activa accidentalmente la máquina sobre sus hijos, que vivirán una autÈntica aventura intentando atravesar el césped del jardín hasta la casa, convertido ahora en una auténtica 'jungla' para ellos." ,
                        genero: "Aventura/Comedia/Fantasía",
                        valoracion: 4.0,
                        funciones: [funcion_07_0, funcion_07_1])

    lazy var pelicula08 = Pelicula(
                        poster: UIImage(named: "lethal_weapon_two")!,
                        titulo: "Lethal Weapon 2 ",
                        clasificacion: "B15",
                        duracion: 110,
                        director: "Richard Donner",
                        reparto: "Mel Gibson, Danny Glover, Joe Pesci, Joss Ackland, Derrick O'Connor, Patsy Kensit, Darlene Love",
                        sinopsis: "La pareja de policías formada por Martin Riggs (Mel Gibson) y su compañero Roger Murtaugh (Danny Glover) se enfrenta ahora a una poderosa organización surafricana de traficantes de droga que opera en Estados Unidos. Su misión principal es la de proteger al testigo protegido Leo Getz (Joe Pesci), un alocado contable que ha blanqueado dinero para la banda y que en unos dÌas va a testificar contra ellos." ,
                        genero: "Acción/Comedia/Policiaco",
                        valoracion: 4.0,
                        funciones: [funcion_08_0, funcion_08_1])

    lazy var pelicula09 = Pelicula(
                        poster: UIImage(named: "little_mermaid")!,
                        titulo: "The Little Mermaid",
                        clasificacion: "A",
                        duracion: 79,
                        director: "John Musker, Ron Clements",
                        reparto: "",
                        sinopsis: "Ariel, hija del rey Tritón, es la princesa de las sirenas. Está a punto de celebrarse su fiesta de cumpleaños y su mayor ilusión es poder conocer a los seres humanos. Con la ayuda de la bruja Úrsula, Ariel consigue subir a la superficie, donde salva de morir ahogado a un hermoso príncipe, cuyo barco acaba de naufragar, del que se enamora perdidamente." ,
                        genero: "Aventura/Comedia/Fantasía/Infantil",
                        valoracion: 3.5,
                        funciones: [funcion_09_0, funcion_09_1])

    lazy var pelicula10 = Pelicula(
                        poster: UIImage(named: "pet_sematary")!,
                        titulo: "Pet Sematary",
                        clasificacion: "B15",
                        duracion: 103,
                        director: "ary Lambert",
                        reparto: "Dale Midkiff, Fred Gwynne, Denise Crosby, Brad Greenquist, Michael Lombard, Miko Hughes, Blaze Berdahl, Susan Blommaert, Mara Clark, Stephen King",
                        sinopsis: "El doctor Louis Creed, su esposa y sus dos niños se instalan en una vivienda próxima a una carretera con mucho tráfico. Cerca de la casa hay un sendero que lleva a un cementerio de animales y también a un antiguo cementerio indio; según la leyenda, los que sean enterrados allí volverán a la vida. Louis comprobará que es cierto cuando el gato de su hija es atropellado por un camión y un extraño vecino llamado Jud resucita al pequeño animal." ,
                        genero: "Terror",
                        valoracion: 3.5,
                        funciones: [funcion_10_0, funcion_10_1])


    override func viewDidLoad() {
        super.viewDidLoad()
        coleccion.dataSource = self
        
        var layout = self.coleccion.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 5, left: 2.5, bottom: 5, right: 2.5)
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: (self.coleccion.frame.size.width)/3-5, height: self.coleccion.frame.size.height/4-5)
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool){
        totalCompra.text = "Total: $\(total).00"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return peliculas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! NumberCollectionViewCell
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 2
        cell.poster.image = peliculas[indexPath.item].poster
        cell.poster.contentMode = .scaleAspectFill

        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        controller.nombre = peliculas[indexPath.item].titulo
        controller.imagen = peliculas[indexPath.item].poster
        controller.director = peliculas[indexPath.item].director
        controller.reparto = peliculas[indexPath.item].reparto
        controller.clasificacion = peliculas[indexPath.item].clasificacion
        controller.duracion = String(peliculas[indexPath.item].duracion)
        controller.sinopsis = peliculas[indexPath.item].sinopsis
        controller.horarios = peliculas[indexPath.item].funciones
        controller.seleccionPelicula = indexPath.item
        controller.vistaUno = self
        self.navigationController?.pushViewController(controller, animated: true)
    }

}

