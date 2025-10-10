import { animals } from "../data/animals.js";


const form = document.querySelector("#form");
const cardWrapper = document.querySelector("#cardWrapper");
const city = document.querySelector("#city");
const type = document.querySelector("#type");
const message = document.querySelector("#message");

/*function qui permet de créer ma liste de choix dynamiquement*/
function createAnimalTypeList(){
    let animalTypeList= new Set();                                               //!new set permet de créer un objet sans duplicata*/
    for (const animal of animals){
        animalTypeList.add(animal.type);
    };
    for (const item of animalTypeList){
           type.innerHTML += `
         <option value="${item}">${item}</option>
    `
    };
};
createAnimalTypeList();

/*line 24-28 :permet de basculer la page d'accueil à la page search avec les param de recherche rentrés dans la barre de recherche du landing page
il faut ajouter methoe et action sur index.html d'abord*/
let paremString = window.location.search;                                      //!window.location.search permet de récupérer les string url après le "?"
let searchParams = new URLSearchParams(paremString);                           //! URLsearchparams() permet de transformer le string récupérer en objet
let typeValue = searchParams.get("type");                                      //!.get est une des méthode de URLsearchparems
let cityValue = searchParams.get("city");

/*function barre de recherche avec les filtres/condition en utilisant les parems url*/
function searchAnimals(typeValue,cityValue){
    if (!typeValue && !cityValue){                                             //*si aucun filtrage, cad pas de clicage sur le bouton recherche, load tous les animaux
        loadAnimals(animals);
    } else {
        let selectedAnimals=[];
        for (const animal of animals){
            if ((animal.city.toLowerCase() === cityValue.toLowerCase() || cityValue === "")  //!if (condition A) && (conditionB) */
                && (animal.type === typeValue || typeValue === "Tout")){
                selectedAnimals.push(animal);
            };
        };
        loadAnimals(selectedAnimals);
        if (selectedAnimals.length===0){
            message.style.display = "block";
            message.innerHTML="Ville non valide";
        }else{
            message.style.display = "block";
            message.innerHTML=`${selectedAnimals.length} résultat(s) trouvé(s).`
        };
    };
};
//lance la function à l'affichage de la page search 
searchAnimals(typeValue,cityValue);

//function qui fait uniquement affichage des éléments avec un param de taleau
function loadAnimals(animals) {
    cardWrapper.innerHTML = ''
    for (const animal of animals) {
        cardWrapper.innerHTML += `
          <div class="card">
                <div class="pic-wrapper"><img src="${animal.imageUrl}"></div>
                <div class="text-wrapper">
                    <p class="type">${animal.type}</p>
                    <h3>${animal.name}</h3>
                    <p>${animal.breed} | ${animal.age}</p>
                    <p>${animal.city}</p>
                    <p class="description">${animal.description}</p>
                </div>
                <button class="meet">Rencontrer</button>
            </div>
        `
    };
};
//sumission formulaire de la page search 
form.addEventListener("submit",(event) => {
    event.preventDefault();
    searchAnimals(type.value,city.value);
});
//ci-dessous la version avec un tableau json 
// const getData = async () => {
//     try {
//         const response = await fetch("/data/data.json");
//         const data = await response.json();
        
//         console.log(data);
//     } catch (error) {
//         console.log("can't reach the local json file")
        
//     };
    
// };
// getData();