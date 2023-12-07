<script setup>
import AdminLayout from '@/Layouts/AdminLayout.vue';
import { Head } from '@inertiajs/vue3';
</script>

<template>
    <Head title="Financeiro" />

    <AdminLayout title="Financeiro">
        
        
        <v-container class='w-100 pa-7 bg-dialog'>
            <h1>Financeiro</h1>
        </v-container>

        <v-container>
            <h1>Pagar / Receber</h1>
        </v-container>

        <v-container>
            <h1>Balanço Patrimonial</h1>
        </v-container>

    </AdminLayout>
</template>
