<script>
    import infoFlash from './infoFlash.js';
    
    let info;
    let affiche = false;
    let numInfo = 0;
    let titre="";
    let contenu="";
    let src="";
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

</script>



        <div class="terre">
            <img class="planeteTerre" src= "/gif.gif" alt="planete terre" on:click={fonctionInfosFlash}/>
        </div>
        <div class="news">
            <a href="/debunk">
                <img class="planeteNews" src= "/news.gif" alt="planete news"/>
                <p>Debunk</p>
            </a>
            
        </div>
        <div class='quizz'>
            <a href="/quizz">
                <img class='planeteQuizz' src= "/quizz.gif" alt="planete quizz"/>
                <p>Quizz</p>
            </a>
        </div>
        <div class='sources'>
            <a href="/sources">
                <img class='planeteSources' src= "/sources.gif" alt="planete sources"/>
                <p>Sources fiables</p>
            </a>
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