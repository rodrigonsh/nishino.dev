<script setup>

import {Head, Link, useForm} from '@inertiajs/vue3';

import GuestLayout from '@/Layouts/GuestLayout.vue';
import CTA from '@/Components/CTA.vue';

defineProps({
    canLogin: Boolean,
    canRegister: Boolean,
});

const years = new Date().getFullYear() - 2001
const age = new Date().getFullYear() - 1984

</script>

<template>    
<GuestLayout canLogin="canRegister" canRegister="canRegister" title="Backend">
    
    <Head title="Backend" />

    <v-container class="longtext">

        <h1 class="mb-6">Backend</h1>

        <p>
            Com mais de 20 anos de experiência em programação em PHP, 
            sou especialista em desenvolver aplicações web robustas e escaláveis. 
            Possuo experiência em uma ampla gama de tecnologias PHP, 
            incluindo Laravel, CodeIgniter, MySQL, Apache, cPanel e Docker.
        </p>

        <h2 class="my-6">Laravel</h2>

        <p>
            Laravel é um framework PHP moderno e flexível que oferece uma ampla 
            gama de recursos para desenvolvedores. Sou proficiente em usar Laravel
            para desenvolver aplicações web, incluindo:
        </p>

        <ul>
            <li>Sites e aplicativos web personalizados</li>
            <li>Aplicações de e-commerce</li>
            <li>Aplicações de gerenciamento de conteúdo (CMS)</li>
            <li>Aplicações de backend com <strong>filas de jobs</strong></li>
        </ul>
        
        <h2 class="my-6">CodeIgniter</h2>

        <p>
            CodeIgniter é outro framework PHP popular que oferece uma 
            abordagem mais simples e direta ao desenvolvimento web. 
            Sou proficiente em usar CodeIgniter para desenvolver aplicações web, incluindo:
        </p>

        <ul>
            <li>Aplicações de pequeno e médio porte</li>
            <li>Aplicações de intranet</li>
            <li>Aplicações de API</li>
        </ul>
        
        <h2 class="my-6">Administração e migração de serviços em nuvem</h2>

        <p>
            Possuo experiência em administrar e migrar serviços em nuvem, 
            incluindo Amazon Web Services (AWS), Googe Firebase e Digital Ocean. Posso ajudá-lo a:
        </p>

        <ul>
            <li>Criar e gerenciar contas em nuvem</li>
            <li>Implantar e gerenciar aplicações em nuvem</li>
            <li>Migrar aplicações para a nuvem</li>
        </ul>
        
        <h2 class="my-6">Integração com serviços financeiros</h2>

        <p>
            Possuo experiência em integrar aplicações web com serviços 
            financeiros, incluindo <strong>Cielo</strong>, <strong>PagSeguro</strong> e <strong>Gerencianet PIX</strong>
        </p>

        <ul>
            <li>Integrar pagamentos em PIX</li>
            <li>Integrar processamento de cartão de crédito</li>
            <li>Integrar gerenciamento de assinaturas</li>
        </ul>
        
        <h2 class="my-6">Ferramentas tradicionais</h2>

        <p>
            Também sou proficiente em usar ferramentas tradicionais de desenvolvimento web, 
            incluindo mas não limitado a Linux,  SSH, MySQL, Apache, cPanel e Docker. Posso ajudá-lo a:
        </p>

        <ul>
            <li>Administrar servidores web</li>
            <li>Gerenciar bancos de dados MySQL</li>
            <li>Gerenciar cPanels</li>
            <li>Usar Docker para implantar aplicações</li>
        </ul>

    </v-container>
    
    <CTA></CTA>
        
</GuestLayout>
</template>
