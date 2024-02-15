function fetch_json (url){
    
fetch(url)
  .then(response=>  {
    if(!response.ok)
    {throw Error("ERROR")}
     return response.json() 
    })
  .then(data =>  {
            //console.log(data);
            const html = data.map(somedata =>{
                return `<ul class="post" id =${somedata.id}>
                <li><h3 class="heading">${somedata.title}</h3></li>
                <li class ="authors"><i>Author: ${somedata.id} </i></li>
                <li><p class ="postbody">${somedata.body}</p></li>
                </ul>
                `;
  }).join('')
  //console.log(html);
  document.querySelector("#app-content").insertAdjacentHTML("afterbegin",html)
})
.catch(error =>{console.log(error);})
}

function load_more(){
    btnclck = document.getElementById("loadmore");
    btnclck.addEventListener('click',
        fetch_json('https://jsonplaceholder.typicode.com/posts/')
    
    );
}


fetch_json('https://jsonplaceholder.typicode.com/posts/?_limit=10');

//filter search results
window.addEventListener("load",() =>{ 
    //searchbar
    var sb= document.getElementById("searchbar");
    list = document.getElementsByTagName('ul');


    sb.onkeyup=() =>{
        var searchResult = sb.value;
        for(let i in list){

            console.log(list[i])

            if(list[i].id !== searchResult && searchResult.length !==0 ){
                console.log(list[i]);
                list[i].className = "hide";
            }
                else {
                    
                    list[i].className = "post";
            
            }
        
        }
        
        
     }
 });
