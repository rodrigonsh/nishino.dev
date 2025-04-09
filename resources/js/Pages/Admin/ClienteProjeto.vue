<script setup>
import AdminLayout from '@/Layouts/AdminLayout.vue';
import { Head, Link } from '@inertiajs/vue3';
import api from '@/api'

const props = defineProps({
    cliente: Object,
    projeto: Object,
    errors: Array,
});


</script>

<template>
    <Head title="Projeto" />

    <AdminLayout title="Projeto">

        <v-container>
        
        <v-row>
        
            <v-col class="flex-grow-1">
                <h1>{{ cliente.name }} ({{ cliente.email }})</h1>
            </v-col>

        </v-row>

        <p>{{  projeto.briefing  }}</p>

        <pre code>{{ JSON.parse(projeto.requisitos) }}</pre>

        <details class="mb-6">
            <summary>Histórico de Chat</summary>
            <p v-for="msg in projeto.messages">
                {{ msg.text }}
            </p>
        </details>


        </v-container>

    </AdminLayout>
</template>
