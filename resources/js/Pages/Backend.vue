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

        <p lang="pt">
            Com mais de 20 anos de experiência em programação em PHP, 
            sou especialista em desenvolver aplicações web robustas e escaláveis. 
            Possuo experiência em uma ampla gama de tecnologias backend, 
            incluindo Laravel, CodeIgniter, MySQL, Apache, cPanel e Docker.
        </p>
        <p lang="en">
            With over 20 years of experience in PHP programming,
            I specialize in developing robust and scalable web applications.
            I have experience in a wide range of backend technologies,
            including Laravel, CodeIgniter, MySQL, Apache, cPanel and Docker.
        </p>
        <p lang="es">
            Con más de 20 años de experiencia en programación PHP,
            Me especializo en el desarrollo de aplicaciones web robustas y escalables.
            Tengo experiencia en una amplia gama de tecnologías backend,
            incluidos Laravel, CodeIgniter, MySQL, Apache, cPanel y Docker.
        </p>

        <h2 class="my-6">Laravel</h2>

        <p lang="pt">
            Laravel é um framework PHP moderno e flexível que oferece uma ampla 
            gama de recursos para desenvolvedores. Sou proficiente em usar Laravel
            para desenvolver aplicações web, incluindo:
        </p>
        <p lang="en">
            Laravel is a modern and flexible PHP framework that offers a wide 
            range of features for developers. I am proficient in using Laravel
            to develop web applications, including:
        </p>
        <p lang="es">
            Laravel es un framework PHP moderno y flexible que ofrece una amplia 
            gama de funciones para desarrolladores. Soy competente en el uso de Laravel
            para desarrollar aplicaciones web, incluyendo:
        </p>

        <ul>
            
            <li lang="pt">Sites e aplicativos web personalizados</li>
            <li lang="en">Customized websites and web applications</li>
            <li lang="es">Sitios web y aplicaciones web personalizadas</li>

            <li lang="pt">Aplicações de e-commerce</li>
            <li lang="en">e-Commerce applications</li>
            <li lang="es">Aplicaciones de comercio electrónico</li>

            <li lang="pt">Aplicações de gerenciamento de conteúdo (CMS)</li>
            <li lang="en">Content Management Applications (CMS)</li>
            <li lang="es">Aplicaciones de gestión de contenidos (CMS)</li>

            <li lang="pt">Aplicações de backend com <strong>Job Queues</strong></li>
            <li lang="en">Backend applications with <strong>Job Queues</strong></li>
            <li lang="es">Aplicaciones backend con <strong>Job Queues</strong></li>

        </ul>
        
        <h2 class="my-6">CodeIgniter</h2>

        <p lang="pt">
            CodeIgniter é outro framework PHP popular que oferece uma 
            abordagem mais simples e direta ao desenvolvimento web. 
            Sou proficiente em usar CodeIgniter para desenvolver aplicações web, incluindo:
        </p>
        <p lang="en">
            CodeIgniter is another popular PHP framework that offers a
            simplest and most direct approach to web development.
            I am proficient in using CodeIgniter to develop web applications, including:
        </p>
        <p lang="es">
            CodeIgniter es otro framework PHP popular que ofrece un
             enfoque más simple y directo para el desarrollo web.
             Soy competente en el uso de CodeIgniter para desarrollar aplicaciones web, que incluyen:
        </p>

        <ul>

            <li lang="pt">Aplicações de pequeno e médio porte</li>
            <li lang="en">Small and medium-sized applications</li>
            <li lang="es">Aplicaciones pequeñas y medianas</li>

            <li lang="pt">Aplicações de intranet</li>
            <li lang="en">Intranet applications</li>
            <li lang="es">Aplicaciones intranet</li>

            <li lang="pt">Aplicações de API</li>
            <li lang="en">API Applications</li>
            <li lang="es">Aplicaciones API</li>


        </ul>
        
        <h2 lang="pt" class="my-6">Administração e migração de serviços em nuvem</h2>
        <h2 lang="en" class="my-6">Administration and migration of cloud services</h2>
        <h2 lang="es" class="my-6">Administración y migración de servicios en la nube.</h2>

        <p lang="pt">
            Possuo experiência em administrar e migrar serviços em nuvem, 
            incluindo Amazon Web Services (AWS), Google Firebase e Digital Ocean. Posso ajudá-lo a:
        </p>
        <p lang="en">
            I have experience in managing and migrating cloud services, 
            including Amazon Web Services (AWS), Google Firebase and Digital Ocean. I can help you:
        </p>
        <p lang="es">
            Tengo experiencia en la gestión y migración de servicios en la nube, 
            incluidos Amazon Web Services (AWS), Google Firebase y Digital Ocean. Puedo ayudarle:
        </p>

        <ul>
            <li lang="pt">Criar e gerenciar contas em nuvem</li>
            <li lang="en">Create and manage cloud accounts</li>
            <li lang="es">Crear y administrar cuentas en la nube</li>

            <li lang="pt">Implantar e gerenciar aplicações em nuvem</li>
            <li lang="en">Deploy and manage cloud applications</li>
            <li lang="es">Implementar y gestionar aplicaciones en la nube</li>

            <li lang="pt">Migrar aplicações para a nuvem</li>
            <li lang="en">Migrate applications to the cloud</li>
            <li lang="es">Migrar aplicaciones a la nube</li>

        </ul>
        
        <h2 lang="pt" class="my-6">Integração com serviços financeiros</h2>
        <h2 lang="en" class="my-6">Integration with financial services</h2>
        <h2 lang="es" class="my-6">Integración con servicios financieros</h2>

        <p lang="pt">
            Possuo experiência em integrar aplicações web com serviços 
            financeiros, incluindo <strong>Cielo</strong>, <strong>PagSeguro</strong> e <strong>Gerencianet PIX</strong>
        </p>
        <p lang="en">
            I have experience in integrating web applications with financial 
            services, including <strong>Cielo</strong>, <strong>PagSeguro</strong> and <strong>Gerencianet PIX</strong>
        </p>
        <p lang="es">
            Tengo experiencia en integración de aplicaciones web con servicios
            financieros, incluidos <strong>Cielo</strong>, <strong>PagSeguro</strong> y <strong>Gerencianet PIX</strong>
        </p>

        <ul>
            <li lang="pt">Integrar pagamentos em PIX</li>
            <li lang="en">Integrate payments in PIX (Brazil)</li>
            <li lang="es">Integrar pagos en PIX (Brasil)</li>

            <li lang="pt">Integrar processamento de cartão de crédito</li>
            <li lang="en">Integrate credit card processing</li>
            <li lang="es">Integrar el procesamiento de tarjetas de crédito</li>

            <li lang="pt">Integrar gerenciamento de assinaturas</li>
            <li lang="en">Integrate subscription management</li>
            <li lang="es">Integrar la gestión de suscripciones</li>

        </ul>
        
        <h2 lang="pt" class="my-6">Ferramentas Tradicionais</h2>
        <h2 lang="en" class="my-6">Traditional Tools</h2>
        <h2 lang="es" class="my-6">Herramientas Tradicionales</h2>

        <p lang="pt">
            Também sou proficiente em usar ferramentas tradicionais de desenvolvimento web, 
            incluindo mas não limitado a: Linux,  SSH, MySQL, Apache, cPanel e Docker. Posso ajudá-lo a:
        </p>
        <p lang="en">
            I am also proficient in using traditional web development tools,
            including but not limited to: Linux, SSH, MySQL, Apache, cPanel and Docker. I can help you:
        </p>
        <p lang="es">
            También soy competente en el uso de herramientas de desarrollo web tradicionales.
            incluidos, entre otros: Linux, SSH, MySQL, Apache, cPanel y Docker. Puedo ayudarle:
        </p>

        <ul>
            <li lang="pt">Administrar servidores web</li>
            <li lang="en">Manage Web Servers</li>
            <li lang="es">Gestionar servidores web</li>

            <li lang="pt">Gerenciar bancos de dados MySQL</li>
            <li lang="en">Manage MySQL databases</li>
            <li lang="es">Gestionar bases de datos MySQL</li>

            <li lang="pt">Gerenciar cPanels</li>
            <li lang="en">Manage cPanels</li>
            <li lang="es">Gestionar cPanels</li>

            <li lang="pt">Usar Docker para implantar aplicações</li>
            <li lang="en">Use Docker to deploy applications</li>
            <li lang="es">Usar Docker para implementar aplicaciones.</li>

        </ul>

    </v-container>
    
    <CTA></CTA>
        
</GuestLayout>
</template>
