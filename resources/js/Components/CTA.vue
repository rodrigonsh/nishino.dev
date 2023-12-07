<script setup>
    import { Link } from '@inertiajs/vue3';
</script>

<template>
<v-container id="cta">

    <div >
        
        <h1 class="mb-6" lang="pt">Converse com nossa AI e agende uma apresentação</h1>
        <h1 class="mb-6" lang="en">Talk to our AI and schedule a presentation</h1>
        <h1 class="mb-6" lang="es">Habla con nuestra IA y programa una presentación</h1>


        <Link href="/harvey" >
        <v-btn lang="pt" prepend-icon="mdi-message" size="x-large">Fale com Harvey</v-btn>
        <v-btn lang="en" prepend-icon="mdi-message" size="x-large">Talk to Harvey</v-btn>
        <v-btn lang="es" prepend-icon="mdi-message" size="x-large">Hable con harvey</v-btn>
        </Link>
        
    </div>
    
    <div class="d-flex flex-column align-center">

        <img src="/img/logo-nsh-white.svg" id="cta-logo" />

        <p class="text-center" lang="pt">
            Vamos construir o projeto dos seus sonhos!
        </p>

        <p class="text-center" lang="en">
            Lets build the project of your dreams!
        </p>

        <p class="text-center" lang="es">
            ¡Construyamos el proyecto de tus sueños!
        </p>

        
    </div>

</v-container>  
</template>