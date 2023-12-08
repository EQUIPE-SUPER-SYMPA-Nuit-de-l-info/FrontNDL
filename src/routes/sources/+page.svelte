<main>
    
    <div id="body">
        <p id="intro">
            Sur internet, tout le monde peut poster les infos qu'il veut, ce qui peut rendre difficile la vérification de ces dernières. Pour vous aider à démêler le vrai du faux, voici quelques sources fiables d'informations en rapport avec l'écologie. 
        </p>
        <div id="contenu">
            <p>
                Le <a href="https://reseauactionclimat.org/">Réseau Action Climat</a> est un réseau de 27 associations nationales et 10 associations locales réunies par le combat contre le changement climatiques. On trouve sur leur site à la fois des articles sur l'actualité en rapport avec l'écologie et des dossiers sur l'impact du réchauffement de l'atmosphère dans différents domaines, accompagnés à chaque fois de leur lot de solutions.
            </p>
            <p>
                L'<a href="https://www.ademe.fr/">ADEME</a> est l'agence de la transition écologique. Il s'agit d'une organisation fille du Ministère de la Transition Écologique et de la Cohésion des Territoires. On trouve sur leur site énormément de ressources sur la gestion de la transition écologique par l'État Français, et ainsi sur les enjeux de ces changements de mode de vie et les objectifs du Ministère. On peut également y trouver des conseils pour participer nous aussi à cette transition. 
            </p>
            <p>
                Le <a href="https://www.ipcc.ch/languages-2/francais/">GIEC</a>  pour Groupe d'experts Intergouvernemental sur l'Évolution du Climat est un organisme sous-jacent à l'ONU qui publie notamment des rapports détaillés qui donnent à la fois l'état du réchauffement climatique, des prédictions sur son évolution, et des recommandations de baisse des émissions pour éviter la catastrophe. Il s'agit probablement de l'organisme faisant le travail de fond le plus qualitatif, et vous connaissez probablement déjà ce dernier. Il existe aujourd'hui une IA qui connaît les derniers rapports du GIEC et est capable de répondre à vos questions sur ce dernier, que vous pouvez retrouver <a href="https://huggingface.co/spaces/Ekimetrics/climate-question-answering">ici.</a>
            </p>
        </div>
    </div>
</main>
<style>
    main {
        height: 100vh;
        font-size: large;
    }

    #body {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin: 3rem
    }

    #header {
        display: flex;
        align-items: center;
        background-color: #6c91c2;
        border-bottom: medium solid #34623f;
    }

    #titrePage {
        font-size: x-large;
        font-weight: bold;
    }

    #titrePage a {
        text-decoration: none;
    }

    #logo {
        width: 12rem
    }

    #contenu p {
        border: thin solid #34623f;
        padding: 1rem;
        border-radius: 1rem;
        box-shadow: inset 0 0 2rem #aaabbc;
    }


</style>
