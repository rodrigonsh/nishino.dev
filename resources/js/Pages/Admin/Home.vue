<script setup>
import AdminLayout from '@/Layouts/AdminLayout.vue';
import { Head } from '@inertiajs/vue3';
</script>

<template>
    <Head title="ADMIN" />

    <AdminLayout title="Área do ADMIN">
        
        <div  style="background-color: rgb(216, 215, 215);">
            <v-container>
                <h1>Área do ADMIN</h1>
            </v-container>
        </div>

        <v-container>

            <h3>Leads em Aberto</h3>
            <h3>Total de Clientes</h3>
            <h3>Outros indicadores</h3>

        </v-container>

    </AdminLayout>
</template>
