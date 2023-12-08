<script>
    import infoFlash from './infoFlash.js';
    import infoFake from './infoFake.js';
    
    let info;
    let affiche = false;
    let numInfo = 0;
    let titre="";
    let contenu="";
    let src="";
    let hell=false;

    import { onMount } from 'svelte';

    let input = [];
    const konamiSequence = ['ArrowUp', 'ArrowUp', 'ArrowDown', 'ArrowDown', 'ArrowLeft', 'ArrowRight', 'ArrowLeft', 'ArrowRight', 'b', 'a'];

    onMount(() => {
        function checkKonamiCode(e) {
            input.push(e.key);
            input.splice(-konamiSequence.length - 1, input.length - konamiSequence.length);

            if (input.join('').includes(konamiSequence.join(''))) {
                hell = true
                document.body.style.backgroundColor = "#ffac93";
                input = []; // Réinitialiser la séquence
            }
        }

        window.addEventListener('keydown', checkKonamiCode);

        return () => {
            window.removeEventListener('keydown', checkKonamiCode);
        };
    });


    function fonctionInfosFlash(){
        affiche = true;
        info = infoFlash[numInfo];
        titre = info.titre;
        contenu = info.contenue;
        src = info.src;
        if(numInfo == infoFlash.length-1){
            numInfo = 0;
        }
        else{
            numInfo = numInfo+1;
        }
        
    }

    function fonctionInfosFake(){
        affiche = true;
        info = infoFake[numInfo];
        titre = info.titre;
        contenu = info.contenue;
        src = info.src;
        if(numInfo == infoFake.length-1){
            numInfo = 0;
        }
        else{
            numInfo = numInfo+1;
        }
        
    }

</script>


<header>
    <h1>{`${hell?"Planete Pas Super Sympa Dutout":"Planete Super Sympa"}`}</h1>

        <div class="terre">
            <img class={`${hell?"planeteTerreHell":"planeteTerre"}`} src={`${hell?"/hell-main.gif":"/gif.gif"}`} alt="planete terre" on:click={hell?fonctionInfosFake:fonctionInfosFlash}/>
        </div>
        <div class="news">
                <img on:click={()=>{window.location.href = '/debunk'}} class={`${hell?"planeteNewsHell":"planeteNews"}`} src={`${hell?"/hell-news.gif":"/news.gif"}`} alt="planete news"/>
                <p>Debunk</p>
        </div>
        <div class='quizz'>
                <img  on:click={()=>{window.location.href = '/quizz'}} class={`${hell?"planeteQuizzHell":"planeteQuizz"}`} src={`${hell?"/hell-quizz.gif":"/quizz.gif"}`} alt="planete quizz"/>
                <p>Quizz</p>
        </div>
        <div class='sources'>
                <img  on:click={()=>{window.location.href = '/sources'}} class={`${hell?"planeteSourcesHell":"planeteSources"}`} src={`${hell?"/hell-sources.gif":"/sources.gif"}`} alt="planete sources"/>
                <p>Sources fiables</p>
        </div>
        {#if affiche == true}
            <div class="infoflash">
                <h2 id = "titre">{titre}</h2>
                <p id = "contenu">{contenu}</p>
                <p id= "src">{src}</p>
            </div>
        {/if}
       
<style>
    
    :global(body) {
        background-color: #eafaf1;
    }
    
    h1{
        font-size: 200%;
        position: absolute;
        top: 50%;
        left: 50%;
        margin-top: -250px;
        margin-left: -650px;

    }
    
    .planeteTerre{
        width: 40%;
        z-index: 2;
    }

    .planeteQuizz{
        width: 30%;
    }

    .planeteNews{
        width: 20%;
    }

    .planeteSources{
        width: 25%;    
    }

    .planeteTerreHell{
        width: 60%;
        margin-left: 40px;
        z-index: 2;
    }

    .planeteQuizzHell{
        width: 30%;
    }

    .planeteNewsHell{
        width: 20%;
    }

    .planeteSourcesHell{
        width: 15%;    
        margin-bottom: 40px;
    }

    .terre{
        display:flex;
        position: absolute;
        top: 50%;
        left: 50%;
        margin-top: -150px;
        margin-left: -225px;
    }
    .news{
        display: grid;
        justify-items: center;
        position: absolute;
        top: 50%;
        left: 50%;
        margin-top: -50px;
        margin-left: -600px;
    }
    .quizz{
        display: grid;
        justify-items: center;
        position: absolute;
        top: 50%;
        left: 50%;
        margin-top: -350px;
        margin-left: -250px;
    }
    .sources{
        display: grid;
        justify-items: center;
        position: absolute;
        top: 50%;
        left: 50%;
        margin-top: 150px;
        margin-left: -200px;
    }
    img:hover{
        scale:1.2;
        cursor: pointer;
    }
    img{
        transition: scale;
        transition-duration: 1s;
    }

    .sources p{
        margin-top: -30px;
    }

    .news p{
        margin-top: -5px;
    }

    .quizz p{
        margin-top: -30px;
    }
    p{
       font-weight: bold;
    }
    .infoflash{
        width: 25%;
        height: fit-content;
        position: absolute;
        top: 50%;
        left: 50%;
        margin-top: -250px;
        margin-left: 300px;
        padding: 20px;
        border: solid;
        border-width: 2px;
        border-radius: 15px;
        border-color: white;
        background-color: white;
    }
    .infoflash p{
        text-align: center;      
        word-wrap: break-word;
        text-align: left;
    }
    a{
        text-decoration: none;
        text-align: center;
        color: black;
    }
    a:after{
        text-decoration: none;
        text-align: center;
        color: black;
    }
    
</style>