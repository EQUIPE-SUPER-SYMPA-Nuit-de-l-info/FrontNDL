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
        darkFaux();
    }
    $:if(tweetSelect===true && mouseX<window.innerWidth/2) {
        lightFaux();
        darkVrai();
    }

    function selectQuestion(){
        question.sort(() => Math.random() - 0.5);
        let selectedQuestion = question.shift();
        return selectedQuestion
    }

    function leftAnswer() {
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

    function rightAnswer() {
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

    function onMouseMove(e) {
        if(tweetSelect) {
            mouseX = e.clientX;
            mouseY = e.clientY;
            divTweet.style.marginLeft = `${mouseX-(window.innerWidth/2)}px`;
            divTweet.style.marginTop = `${mouseY-(window.innerHeight/3)-100}px`;
        }
    }
    function onMouseDown() {
        tweetSelect = true;
    }
    function onMouseUp() {
        tweetSelect = false;
        if(mouseX>window.innerWidth/2){
            leftAnswer();
        }
        if(mouseX<window.innerWidth/2){
            rightAnswer();
        }
    }

    function sourisGauche() {
      return (tweetSelect && mouseX<window.innerWidth/2);
    }
    function sourisDroite() {
      return (tweetSelect && mouseX>window.innerWidth/2);
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
    <h3 id="explaination">Glissez l'affirmation à gauche si vous pensez qu'elle est fausse, à droite si vous pensez qu'elle est vraie</h3>
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
    <!-- svelte-ignore a11y-click-events-have-key-events -->
    <div id="faux" class={`${sourisGauche() ? "light-faux" : "dark-faux"}`} role="button" on:click={leftAnswer} tabindex="0">
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
    <!-- svelte-ignore a11y-click-events-have-key-events -->
    <div id="vrai" class={`${sourisDroite() ? "light-vrai" : "dark-vrai"}`} role="button" on:click={rightAnswer} tabindex="0">
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
  body {
    margin: 0;
    background-color: #eafaf1;
}

#main {
    display: flex;
    height: 78vh;
    flex-direction: column;
    justify-content: flex-end;
    align-items: center;
}

#vraifaux {
    z-index: 0;
    display: flex;    
    transition: scale;
    transition-duration: 1.3s;
    gap: 50px;
    padding-bottom: 0px;
    padding-top: 0px;
}

#vrai, #faux {
    width: 80px;
    height: 80px;
    border-radius: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: large;
    transition: background-color;
    transition-duration: 0.3s;
    cursor: pointer;
}

.dark-faux {
    border: 3px solid rgb(224, 0, 0);
    
}

.dark-faux svg {
    /* fill and stroke to red */
    fill: rgb(224, 0, 0);
    stroke: rgb(224, 0, 0);
}

.dark-faux:hover, .light-faux {
    background-color: rgb(224, 0, 0);
    color: white;
    scale: 1.1;   
}

.dark-vrai:hover, .light-vrai {
    background-color: rgb(1, 176, 1);
    color: white;
    scale: 1.1;   
    
}

.dark-faux:hover svg, .light-faux svg {
    fill: white;
    stroke: white;
}

.dark-vrai:hover svg, .light-vrai svg {
    fill: white;
    stroke: white;
}

.dark-vrai svg {
    /* fill and stroke to red */
    fill: rgb(1, 176, 1);
    stroke: rgb(1, 176, 1);
}

.dark-vrai {
    border: 3px solid rgb(1, 176, 1);
}

#tweet {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    z-index: 10;
    height: fit-content;
    border-collapse: collapse;
    display: flex;
    flex-direction: column;
    user-select: none;
    width: fit-content;
    transition: margin;
    transition-duration: 0.03s;
    cursor: pointer;
}

#contenu, #source {
    background-color: white;
    padding-top: 10px;
    padding-bottom: 10px;
    padding-left: 20px;
    padding-right: 20px;
    width: 300px;
    border: solid;
    border-width: 0.5px;
    border-color: rgb(184, 184, 184);
}

#contenu {
    border-top-left-radius: 15px;
    border-top-right-radius: 15px;
}

#source {
    border-top: none;
    border-bottom-left-radius: 15px;
    border-bottom-right-radius: 15px;
}

#auteur {
    display: flex;
    gap: 10px;
}

#auteur img {
    height: 50px;
    width: 50px;
    border-radius: 100%;
    border: solid;
    border-width: 0.5px;
    border-color: rgb(184, 184, 184);
    pointer-events: none;
}

#nom-auteur {
    font-weight: bold;
}

#affirmation {
    text-align: justify;
}

#points{
    margin-bottom: 50px;
}

#heartBox{
    display: flex;
    margin-bottom: 25px;
}

#explaination{
    text-align: center;
    padding: 25px;
    margin: 0;
    width: 100%;
    background-color: #b6dac6;
    border-top: thin solid #34623F;
}

#header {
    width: 100vw;
    overflow: hidden;
}

</style>
