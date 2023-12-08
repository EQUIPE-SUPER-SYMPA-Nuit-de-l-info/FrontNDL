<div>
<h1>Oops... Tu as perdu</h1>
<h2>Encore un peu d'effort et tu sauveras le monde !</h2>
<div><button on:click={()=>{window.location.href = '/quizz'}}>Réessayer</button></div>
<div><button on:click={()=>{window.location.href = '/'}}>Retourner au menu</button></div>
</div>
<style>
    div{
        text-align: center;
    }
    button{
        background-color: white;
        padding: 10px;
        padding-left: 25px;
        padding-right: 25px;
        border-radius: 20px;
        border: none;
        font-size: large;
        margin:25px;
    }
    button:hover{
        background-color: #b6dac6;

    }
</style>
