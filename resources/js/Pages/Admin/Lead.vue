<script setup>
import AdminLayout from '@/Layouts/AdminLayout.vue';
import { Head, Link } from '@inertiajs/vue3';
import api from '@/api'

const props = defineProps({
    lead: Object,
    errors: Array,
});

const converter = function()
{
    console.log('converter',  props.lead.id)
    api.converterLead(props.lead)
}

const descartarLead = function()
{
    let self = this
    console.log('descartar',  props.lead.id)
    api
        .descartarLead(props.lead)
        .then(()=>
        {
           window.location =  "/admin/leads";
        })
}

</script>

<template>
    <Head title="LEAD" />

    <AdminLayout title="LEAD">

        <v-container>
        
        <v-row>
        
            <v-col class="flex-grow-1">
                <h1>{{ lead.name }} ({{ lead.email }})</h1>
            </v-col>    

            <v-col class="flex-grow-0 flex-shrink-1">
                <v-btn
            prepend-icon="mdi-account"
            append-icon="mdi-menu-down"
            @click="teste"
        >

        Ações
        
    
        <v-menu offset-y activator="parent">
            
            <v-list>

                <v-list-item  @click="converter()" prepend-icon="mdi-thumb-up">
                    Converter lead em Projeto
                </v-list-item>
            
                <v-divider />
                
                <v-list-item @click="descartarLead()" prepend-icon="mdi-delete" class="text-error">
                    Descartar Lead
                </v-list-item>
            
            </v-list>

        </v-menu>

    </v-btn>
            </v-col>

        </v-row>


        <pre code>{{ JSON.parse(lead.body) }}</pre>

        <details class="mb-6">
            <summary>Histórico de Chat</summary>
            <p v-for="msg in lead.messages">
                {{ msg.text }}
            </p>
        </details>


        </v-container>

    </AdminLayout>
</template>
