<script setup>
    import { Link } from '@inertiajs/vue3';
</script>

<template>
<v-container id="cta" class="mt-4">

    <div >
        
        <h1 class="mb-6" lang="pt">Vamos construir o projeto dos seus sonhos!</h1>
        <h1 class="mb-6" lang="en">Lets build the project of your dreams!</h1>
        <h1 class="mb-6" lang="es">¡Construyamos el proyecto de tus sueños!</h1>

        
        <p lang="pt">
            Entre em contato comigo hoje mesmo para saber mais sobre como posso ajudar sua empresa a alcançar seus objetivos.
        </p>

        <p lang="es">
            Contácteme hoy para obtener más información sobre cómo puedo ayudar a su empresa a alcanzar sus objetivos.
        </p>

        <p lang="en">
            Contact me today to learn more about how I can help your business achieve its goals.
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
            Consultancy: <strong>US$ 30,00 / hour</strong>
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