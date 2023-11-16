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
            Converse com nossa AI  e feche hoje mesmo seu contrato
        </p>

        <p lang="es">
            Habla con nuestra IA y cierra tu contrato hoy
        </p>

        <p lang="en">
            Talk to our AI and close your contract today
        </p>

        
    </div>
    <Link href="/harvey" >
            <v-btn lang="pt" prepend-icon="mdi-message" size="x-large">Fale com Harvey</v-btn>
            <v-btn lang="en" prepend-icon="mdi-message" size="x-large">Talk to Harvey</v-btn>
            <v-btn lang="es" prepend-icon="mdi-message" size="x-large">Hable con harvey</v-btn>
        </Link>

</v-container>


<v-container class="bg-footer">
    <strong>NISHINO LTDA</strong><br />
    48.129.023/0001-27
</v-container>


</template>