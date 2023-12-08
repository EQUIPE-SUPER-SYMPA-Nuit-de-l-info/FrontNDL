<header>
    <div id="header">
        <a href="/"><img id="logo" src="/logo_super_sympa.png"></a>
        <span id="titrePage"><a href="/">Planete Super Sympa</a></span>
    </div>
</header>
<slot></slot>
<style>
     #header {
        display: flex;
        align-items: center;
        background-color: #b6dac6;
    }
    #logo {
        width: 12rem
    }
    #titrePage {
        font-size: x-large;
        font-weight: bold;
    }

    #titrePage a {
        text-decoration: none;
    }
</style>