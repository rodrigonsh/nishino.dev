<script setup>
    import { Link } from '@inertiajs/vue3';
</script>

<template>
<v-container id="cta" class="mt-4">

    <div >
        
        <h1 lang="pt">Vamos construir o projeto dos seus sonhos!</h1>
        <h1 lang="en">Lets build the project of your dreams!</h1>
        <h1 lang="es">¡Construyamos el proyecto de tus sueños!</h1>

        <p lang="pt">
            Vai montar um website? App? Vamos marcar uma reunião
            e viabilizar sua ideia
        </p>

        <p lang="en">
            ¿Vas a montar un sitio web? ¿Aplicación? Organicemos una reunión
             y hacer viable tu idea
        </p>

        <p lang="es">
            Are you going to set up a website? App? Let's set up a meeting
             and make your idea viable
        </p>

        <p lang="pt">
            Desenvolvimento: <strong>US$ 50,00 / hora</strong> <br />
            Consultoria: <strong>US$ 30,00 por hora</strong>
        </p>

        <p lang="es">
            Desarollo: <strong>US$ 50,00 / hora</strong> <br />
            Consultoría: <strong>US$ 30,00 por hora</strong>
        </p>

        <p lang="en">
            Development: <strong>US$ 50,00 / hour</strong> <br />
            Consulting: <strong>US$ 30,00 / hour</strong>
        </p>

        <div class='d-flex justify-md-end justify-sm-end justify-center'>
        <Link href="/contato" >
            <v-btn lang="pt" prepend-icon="mdi-message" size="large">Entrar em contato</v-btn>
            <v-btn lang="en" prepend-icon="mdi-message" size="large">Get in touch</v-btn>
            <v-btn lang="es" prepend-icon="mdi-message" size="large">Cuenta conmigo</v-btn>
        </Link>
        </div>
    </div>

</v-container>
</template>