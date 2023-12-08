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
<div id="header">
    <button on:click={()=>{window.location.href = '../'}}>
        <svg
        xmlns="http://www.w3.org/2000/svg"
        width="24"
        height="24"
        viewBox="0 0 24 24"
        fill="black"
        stroke="currentColor"
        stroke-width="1"
        stroke-linecap="round"
        stroke-linejoin="round"
        class="w-4 h-4"
      >
        <path
          d="M3.24,7.51c-0.146,0.142-0.146,0.381,0,0.523l5.199,5.193c0.234,0.238,0.633,0.064,0.633-0.262v-2.634c0.105-0.007,0.212-0.011,0.321-0.011c2.373,0,4.302,1.91,4.302,4.258c0,0.957-0.33,1.809-1.008,2.602c-0.259,0.307,0.084,0.762,0.451,0.572c2.336-1.195,3.73-3.408,3.73-5.924c0-3.741-3.103-6.783-6.916-6.783c-0.307,0-0.615,0.028-0.881,0.063V2.575c0-0.327-0.398-0.5-0.633-0.261L3.24,7.51 M4.027,7.771l4.301-4.3v2.073c0,0.232,0.21,0.409,0.441,0.366c0.298-0.056,0.746-0.123,1.184-0.123c3.402,0,6.172,2.709,6.172,6.041c0,1.695-0.718,3.24-1.979,4.352c0.193-0.51,0.293-1.045,0.293-1.602c0-2.76-2.266-5-5.046-5c-0.256,0-0.528,0.018-0.747,0.05C8.465,9.653,8.328,9.81,8.328,9.995v2.074L4.027,7.771z"
        ></path>
      </svg>Menu</button><h3 id="explaination">Glissez l'affirmation à gauche si vous pensez qu'elle est fausse, à droite si vous pensez qu'elle est vraie</h3>
</div>
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
