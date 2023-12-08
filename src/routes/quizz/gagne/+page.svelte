<div>
    <h1>Bravo tu as complété toutes les questions !</h1>
    <h2>Tu es sur la bonne voie pour sauver la planete !</h2>
    <div><button on:click={()=>{window.location.href = '/quizz'}}>Rejouer</button></div>
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
    