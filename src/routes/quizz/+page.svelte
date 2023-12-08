<script>
    import { onMount } from 'svelte';
    import question from '../../lib/affirmations-quizz';

    let tweetSelect = null;
    let divFaux;
    let divVrai;
    let divTweet;
    let mouseX;
    let mouseY;
    let compteurPoints = 0;
    let vies = 3;
    let actualQuestion = selectQuestion();
    console.log(actualQuestion.affirmation)

  onMount(() => {
    divFaux = document.getElementById("faux");
    divVrai = document.getElementById("vrai");
    divTweet = document.getElementById("tweet");
  });

    $:if(tweetSelect===true && mouseX>window.innerWidth/2) {
        lightVrai();
        darkFaux();
    }
    $:if(tweetSelect===false) {
        darkVrai();
    }
    $:if(tweetSelect===true && mouseX<window.innerWidth/2) {
        lightFaux();
        darkVrai();
    }
    $:if(tweetSelect===false) {
        darkFaux();
    }

    function selectQuestion(){
        question.sort(() => Math.random() - 0.5);
        let selectedQuestion = question.shift();
        return selectedQuestion
    }

    function onMouseMove(e) {
        if(tweetSelect) {
            mouseX = e.clientX;
            mouseY = e.clientY;
            divTweet.style.marginLeft = `${mouseX-(window.innerWidth/2)}px`;
            divTweet.style.marginTop = `${mouseY-(window.innerHeight/3)}px`;
        }
    }
    function onMouseDown() {
        tweetSelect = true;
    }
    function onMouseUp() {
        tweetSelect = false;
        if(mouseX>window.innerWidth/2){
            if(actualQuestion.reponse){
                compteurPoints+=1;
                if(question.length===0){
                    window.location.href = '/quizz/gagne';
                }
                else{
                actualQuestion = selectQuestion();
                console.log(actualQuestion.affirmation)
                console.log("points : " + compteurPoints);
                console.log("vies : " + vies);
                divTweet.style.marginTop = `0px`;
                divTweet.style.marginLeft = `0px`;
                }
            }
            else{
                if(vies>0){
                    if(question.length===0){
                    window.location.href = '/quizz/gagne';
                    }
                    else{
                    vies-=1;
                    actualQuestion = selectQuestion();
                    console.log(actualQuestion.affirmation)
                    divTweet.style.marginTop = `0px`;
                    divTweet.style.marginLeft = `0px`;
                    }
                }
                if(vies<=0){
                    console.log("perdu")
                    window.location.href = '/quizz/perdu';
                }
                console.log("points : " + compteurPoints);
                console.log("vies : " + vies);
            }
        }
        if(mouseX<window.innerWidth/2){
            if(!actualQuestion.reponse){
                if(question.length===0){
                    window.location.href = '/quizz/gagne';
                }
                else{
                compteurPoints+=1;
                actualQuestion = selectQuestion();
                console.log(actualQuestion.affirmation)
                console.log("points : " + compteurPoints);
                console.log("vies : " + vies);
                divTweet.style.marginTop = `0px`;
                divTweet.style.marginLeft = `0px`;
                }
            }
            else{
                if(vies>0){
                    vies-=1;
                    if(question.length===0){
                    window.location.href = '/quizz/gagne';
                    }
                    else{
                    actualQuestion = selectQuestion();
                    console.log(actualQuestion.affirmation)
                    divTweet.style.marginTop = `0px`;
                    divTweet.style.marginLeft = `0px`;
                    }
                }
                if(vies<=0){
                    console.log("perdu")
                    window.location.href = '/quizz/perdu';
                }
                console.log("points : " + compteurPoints);
                console.log("vies : " + vies);
            }
        }
    }
    function lightFaux() {
        divFaux.classList.remove('dark-faux');
        divFaux.classList.add('light-faux');
    }
    function darkFaux() {
        divFaux.classList.remove('light-faux');
        divFaux.classList.add('dark-faux');
    }
    function lightVrai() {
        divVrai.classList.remove('dark-vrai');
        divVrai.classList.add('light-vrai');
    }
    function darkVrai() {
        divVrai.classList.remove('light-vrai');
        divVrai.classList.add('dark-vrai');
    } 
</script>
<div id="main" on:mousemove={onMouseMove} role="button" tabindex="0">
    <div id="heartBox">
    <svg
    xmlns="http://www.w3.org/2000/svg"
    width="24"
    height="24"
    viewBox="0 0 24 24"
    fill={`${vies>0?"red":"none"}`}
    stroke="currentColor"
    stroke-width="2"
    stroke-linecap="round"
    stroke-linejoin="round"
    class="w-4 h-4"
  >
    <path
      d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z"
    ></path>
  </svg>
  <svg
  xmlns="http://www.w3.org/2000/svg"
  width="24"
  height="24"
  viewBox="0 0 24 24"
  fill={`${vies>1?"red":"none"}`}
  stroke="currentColor"
  stroke-width="2"
  stroke-linecap="round"
  stroke-linejoin="round"
  class="w-4 h-4"
>
  <path
    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z"
  ></path>
</svg>
<svg
xmlns="http://www.w3.org/2000/svg"
width="24"
height="24"
viewBox="0 0 24 24"
fill={`${vies>2?"red":"none"}`}
stroke="currentColor"
stroke-width="2"
stroke-linecap="round"
stroke-linejoin="round"
class="w-4 h-4"
>
<path
  d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z"
></path>
</svg>
</div>
  <div id="vraifaux">
    <div id="faux" class="dark-faux" role="button" tabindex="0">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        width="24"
        height="24"
        viewBox="0 0 24 24"
        fill="none"
        stroke="currentColor"
        stroke-width="2"
        stroke-linecap="round"
        stroke-linejoin="round"
        class="w-4 h-4"
      >
        <path
          d="M11 2a2 2 0 0 0-2 2v5H4a2 2 0 0 0-2 2v2c0 1.1.9 2 2 2h5v5c0 1.1.9 2 2 2h2a2 2 0 0 0 2-2v-5h5a2 2 0 0 0 2-2v-2a2 2 0 0 0-2-2h-5V4a2 2 0 0 0-2-2h-2z"
        ></path>
      </svg>
    </div>
    <div id="vrai" class="dark-vrai" role="button" tabindex="0">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        width="24"
        height="24"
        viewBox="0 0 24 24"
        fill="none"
        stroke="currentColor"
        stroke-width="2"
        stroke-linecap="round"
        stroke-linejoin="round"
        class="w-4 h-4"
      >
        <path
          d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z"
        ></path>
      </svg>
    </div>
  </div>
  <div
    id="tweet"
    on:mousedown={onMouseDown}
    on:mouseup={onMouseUp}
    role="button"
    tabindex="0"
  >
    <div id="contenu">
      <div id="auteur">
        <img
          src="https://thumbs.dreamstime.com/b/profil-vectoriel-avatar-par-d%C3%A9faut-utilisateur-179376714.jpg"
          alt="avatar"
        />
        <p id="nom-auteur">{actualQuestion.auteur}</p>
      </div>
      <p id="affirmation">
        {actualQuestion.affirmation}
      </p>
    </div>
    <div id="source">
      <p>source : {actualQuestion.source}</p>
    </div>
  </div>
  <h1 id="points">{compteurPoints} point(s)</h1>
</div>

<style>
  @import "./quizz.css";
</style>
