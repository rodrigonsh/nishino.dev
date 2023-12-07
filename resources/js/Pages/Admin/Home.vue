<script setup>
import AdminLayout from '@/Layouts/AdminLayout.vue';
import { Head } from '@inertiajs/vue3';
</script>

<template>
    <Head title="ADMIN" />

    <AdminLayout title="Área do ADMIN">
        
        <v-container class='w-100 pa-7 bg-dialog'>
            <h1>Visão geral Admin</h1>
        </v-container>

        <v-container>

            <h3>Leads em Aberto</h3>
            <h3>Total de Clientes</h3>
            <h3>Outros indicadores</h3>

        </v-container>

    </AdminLayout>
</template>
