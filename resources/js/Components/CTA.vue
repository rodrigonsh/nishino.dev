<script setup>
    import { Link } from '@inertiajs/vue3';
</script>

<template>
<v-container id="cta">

    <div >
        
        <h1 class="mb-6" lang="pt">Converse com nossa AI  e feche hoje mesmo seu contrato</h1>
        <h1 class="mb-6" lang="en">Habla con nuestra IA y cierra tu contrato hoy</h1>
        <h1 class="mb-6" lang="es">Talk to our AI and close your contract today</h1>

        
        <p lang="pt">
            Vamos construir o projeto dos seus sonhos!
        </p>

        <p lang="es">
            Lets build the project of your dreams!
        </p>

        <p lang="en">
            ¡Construyamos el proyecto de tus sueños!
        </p>

        
    </div>
    <Link href="/harvey" >

        <img src="/img/logo-nsh-white.svg" id="cta-logo" />

        <v-btn lang="pt" prepend-icon="mdi-message" size="x-large">Fale com Harvey</v-btn>
        <v-btn lang="en" prepend-icon="mdi-message" size="x-large">Talk to Harvey</v-btn>
        <v-btn lang="es" prepend-icon="mdi-message" size="x-large">Hable con harvey</v-btn>
    </Link>

</v-container>  
</template>