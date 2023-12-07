<script>
    import { onMount } from 'svelte';

    let tweetSelect = null;
    let divFaux;
    let divVrai;
    let divTweet;
    let mouseX;
    let mouseY;

    onMount(() => {
        divFaux = document.getElementById("faux");
        divVrai = document.getElementById("vrai");
        divTweet = document.getElementById("tweet")
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

    function onMouseMove(e) {
        if(tweetSelect) {
            mouseX = e.clientX;
            mouseY = e.clientY;
            divTweet.style.marginLeft = `${mouseX-(window.innerWidth/2)}px`;
            divTweet.style.marginTop = `${mouseY-(window.innerHeight/2)}px`;
        }
    }
    function onMouseDown() {
        tweetSelect = true;
    }
    function onMouseUp() {
        tweetSelect = false;
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
    <div id="vraifaux">
        <div id="faux" class="dark-faux" role="button" tabindex="0">
            FAUSSE INFO
        </div>
        <div id="vrai" class="dark-vrai" role="button" tabindex="0">
            VRAIE INFO
        </div>
    </div>
    <div id="tweet" on:mousedown={onMouseDown} on:mouseup={onMouseUp} role="button" tabindex="0">
        <div id="contenu">
            <div id="auteur">
                <img src="https://thumbs.dreamstime.com/b/profil-vectoriel-avatar-par-d%C3%A9faut-utilisateur-179376714.jpg" alt="avatar"/>
                <p id="nom-auteur">Auteur</p>
            </div>
            <p id="affirmation">Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500.</p>
        </div>
        <div id="source">
            <p>source</p>
        </div>
    </div>
</div>

<style>
    @import './quizz.css';
</style>