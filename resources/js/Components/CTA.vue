<script setup>
    import { Link } from '@inertiajs/vue3';
</script>

<template>
<v-container id="cta">

    <div class="d-flex flex-column align-center">
        
        <h1 class="mb-6" lang="pt">Nosso projeto</h1>
        <h1 class="mb-6" lang="en">Our project</h1>
        <h1 class="mb-6" lang="es">Nuestro proyecto</h1>

        <div class="d-flex gap-4">


            <Link href="/todoke">
                <v-btn lang="pt" prepend-icon="mdi-github" size="x-large">Projeto TODOKE</v-btn>
                <v-btn lang="en" prepend-icon="mdi-github" size="x-large">TODOKE Project</v-btn>
                <v-btn lang="es" prepend-icon="mdi-github" size="x-large">Proyecto TODOKE</v-btn>
            </Link>
        </div>
    </div>
    
    <div class="d-flex flex-column align-center">

        <img src="/img/logo-nsh-white.svg" id="cta-logo" />

        <p class="text-center" lang="pt">
            Sistema de Delivery open source.
        </p>

        <p class="text-center" lang="en">
            Open source delivery system.
        </p>

        <p class="text-center" lang="es">
            Sistema de entrega de código aberto.
        </p>

        
    </div>

</v-container>  
</template>
