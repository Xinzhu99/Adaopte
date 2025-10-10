import { animals } from "../data/animals.js";
/* créer un menu déroulant dynamiquement*/
function createAnimalTypeList(){
    let animalTypeList= new Set();                                                 //!new set permet de créer un objet sans duplicata*/
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




