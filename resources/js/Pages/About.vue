<script setup>

import {Head, Link, useForm} from '@inertiajs/vue3';

import GuestLayout from '@/Layouts/GuestLayout.vue';



defineProps({
    canLogin: Boolean,
    canRegister: Boolean,
    laravelVersion: String,
    phpVersion: String,
    status: String
});

const years = new Date().getFullYear() - 2001
const age = new Date().getFullYear() - 1984

</script>

<template>    
<GuestLayout canLogin="canRegister" canRegister="canRegister" title="Nishino">
    
    <Head title="Sobre" />

    <v-container class="h-100">

        <img id="young-me" src="/img/young-me.jpg" />

        <p>Hi! I’m Rodrigo, {{ age }} years, FullStack Developer and Sofia’s father 😁. I live in Campo Grande / MS - Brazil</p>

        <p>
            I began my firsts steps towards design in 1994 learning Corel
            Draw. I used to draw and print business cards in Campo Limpo
            Paulista / SP.
        </p>

        <p>
            In 2001, when I was studying Biology at UFMS in Corumbá / MS I had access to
            the computer lab with free internet and I decided to learn programming in
            Python through <a href="https://github.com/ramalho/aprendaprog" target="_blank">
                Luciano Ramalho’s “Aprenda a Programar” (Learn to Program)</a>.
        </p>

        <p>
            At that time my brother used to work in a local newspaper called Gazeta
            Corumbaense creating ads and layouts when an opportunity appeared to
            develop a website for one of the clients. My brother designed the webpage and
            I programmed it in DreamWeaver.
        </p>

        <p>
            As I still didn’t know PHP programming, I asked a friend to help me with the
            code for the contact form and then I decided to research and learn to program
            in PHP.
        </p>

        <p>
            It's been <strong>{{ years }} years</strong> since then. 
            <strong>AND NOW I'M BALD!</strong>
        </p>

        <v-timeline align="start" density="compact" side="end" line-inset="16">

            <v-timeline-item size="16">
            <template v-slot:opposite>Before 2007</template>
            <div>
                <strong>Before 2007</strong>
                <div class="text-h6">Webpages to local companies</div>
                <p>Pantur, Pantagro, Hotel Águas do Pantanal in Corumbá, Studium 1054 and 
                    some experimental projects with digital tickets</p>
            </div>
            </v-timeline-item>

            <v-timeline-item size="16">
            <template v-slot:opposite>2007 - Today</template>
            <div>
                <strong>2007 - Today</strong>
                <div class="text-h6">
                    <a href="https://vitrinevirtual.com" target="_blank">
                        VitrineVirtual
                    </a>
                </div>
                <p>
                    Lead Developer and Maintainer<br />
                    A website for events and parties in and around Corumbá and Campo Grande.
                    
                </p>
            </div>
            </v-timeline-item>

            <v-timeline-item size="16">
            <template v-slot:opposite>
                2008 - Today
            </template>
            <div>
                <strong>2008 - Today</strong>
                <div class="text-h6">
                    <a href="https://diarionine.com.br" target="_blank">
                        Diário Corumbaense
                    </a>
                </div>
                <p>
                    Lead Developer and Maintainer. <br />
                    PHP + SCSS + JS + MYSQL + Digital Ocean<br />
                    <a target="_blank" href="https://diarionline.com.br/?s=noticia&id=6" >Here is the first published article!</a>. 
                    This journalistic portal became the main source of news in the region until this
                    day
                </p>
            </div>
            </v-timeline-item>

            <v-timeline-item size="16">
            <template v-slot:opposite> 2014 – 2015 (9 months)</template>
            <div>
                <strong>2014 – 2015</strong>
                <div class="text-h6">
                    <a href="https://brbyte.com" target="_blank">
                        BrByte
                    </a>
                </div>
                <p>
                    Graphical User Interfaces for their
                    (now discontinued) Speedr Cache with the EXT Framework (currently
                    Sencha) and programming in PHP with Zend Framework.
                </p>
            </div>
            </v-timeline-item>  

            <v-timeline-item size="16">
            <template v-slot:opposite>2014 – 2015</template>
            <div>
                <strong>2014 – 2015</strong>
                <div class="text-h6">IFMS ( Federal Institude of Mato grosso do Sul )</div>
                <p>
                    I enrolled in Systems Analysis and Development in the first class of Instituto
                    Federal de Mato Grosso do Sul (IFMS). There I studied C and Java, Games in
                    Cordova, Requirements Gathering, SQL, Project Management and Excelled in
                    Web Development 1 & 2. Unfortunately I had to leave the course with 6 months
                    left for personal reasons.
                </p>
            </div>
            </v-timeline-item> 

            <v-timeline-item size="16">
            <template v-slot:opposite>2014 and 2018</template>
            <div>
                <strong>2014 and 2018</strong>
                <div class="text-h6">UFMS ( Federal University of Mato Grosso do Sul )</div>
                <p>
                    Although not being graduated, I was invited in two ocasions to teach (for free)
                    at UFMS for the Information Systems class. There, I teached Python for three
                    months and C for one month. The lessons were my translations based on the
                    Introduction to Computer Science from MIT through OpenCouseWare. UNO!
                </p>
            </div>
            </v-timeline-item>  

            <v-timeline-item size="16">
            <template v-slot:opposite>2015 and 2020</template>
            <div>
                <strong>2015 – 2020</strong>
                <div class="text-h6">
                    <a href="https://caimasul.com" target="_blank">
                        Caimasul
                    </a>
                </div>
                <p>
                    Caimasul is a farm that produces Caiman Meat ( a kind of crocodile 🐊 )
                    There I developed an app ( CaimanSys ) for in-field biodata collection.
                    Stack: Cordova, Onsen Framework, Firebase
                </p>
            </div>
            </v-timeline-item>  

            <v-timeline-item size="16">
            <template v-slot:opposite>2016</template>
            <div>
                <strong>2016</strong>
                <div class="text-h6">SOFIA!</div>
                <p>
                    While man makes plans, God laughs
                </p>
            </div>
            </v-timeline-item>  


            <v-timeline-item size="16">
            <template v-slot:opposite>2017</template>
            <div>
                <strong>2017</strong>
                <div class="text-h6">
                    <a href="https://domiciliodigital.com.br/" target="_blank">
                        Domicílio Digital & Multisig
                    </a>
                </div>
                <p>
                    Website + Cms development: Main Challenge: <strong>Login with USB Token Authentication</strong>
                    Stack: Laravel + Bolt CMS
                </p>
            </div>
            </v-timeline-item>  

            <v-timeline-item size="16">
            <template v-slot:opposite>2019 – 2020</template>
            <div>
                <strong>2019 – 2020</strong>
                <div class="text-h6">Galo de Ouro</div>
                <p>
                    A local betting company, there I developed their logistics 
                    app ( Cordova + Firebase ) and website. 
                    That’s when the pandemic hit and the company ended.
                </p>
            </div>
            </v-timeline-item>  

            <v-timeline-item size="16">
            <template v-slot:opposite>end of 2020</template>
            <div>
                <strong>end of 2020</strong>
                <div class="text-h6">Moved to Campo Grande</div>
            </div>
            </v-timeline-item>  

            <v-timeline-item size="16">
            <template v-slot:opposite>2020 (3 months)</template>
            <div>
                <strong>2020 (3 months)</strong>
                <div class="text-h6">
                    <a href="https://brbyte.com" target="_blank">
                        BrByte
                    </a>
                </div>
                <p>
                    Developed User Interfaces in React and a prototype for 
                    real-time CCTV movement detection in Javascript.
                </p>
            </div>
            </v-timeline-item>  

            <v-timeline-item size="16">
            <template v-slot:opposite>2021 - 2022</template>
            <div>
                <strong>2021 - 2022</strong>
                <div class="text-h6">
                    <a href="https://ezoom.com.br">Ezoom</a>
                </div>
                <p>
                    An agency for digital projects with some well-known companies here in Brazil.
                    There I helped to develop sistems for Angelatti, Muck, Brindec, Bewine, Cemag,
                    Idealux, Marcopolo, Malwee, Coester, Asa Representações and some minor
                    clients.
                </p>

                <p>
                    I was also invited to lead a squad for 4 months.
                    The stack was Laravel, Code Igniter, Angular, Ionic, Vue, Gulp, Cpanel, SSH …
                    the usual stuff.

                    The old projects in Code Igniter heavly used handcrafted SQL queries and I also
                    worked on database optimizations for some clients ( Notably: Angellati )
                </p>
            </div>
            </v-timeline-item>  

            <v-timeline-item size="16">
            <template v-slot:opposite>2023</template>
            <div>
                <strong>2023</strong>
                <div class="text-h6">
                    <a href="https://bright.pt" target="_blank">
                        Bright.pt
                    </a>
                </div>
                <p>
                    FullStack development with TALL Stack + Flutter
                </p>
            </div>
            </v-timeline-item>  


            </v-timeline>

    </v-container>
        
        
</GuestLayout>
</template>
