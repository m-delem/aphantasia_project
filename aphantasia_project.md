---
output:
  pdf_document:
    toc: yes
    toc_depth: 5
    number_sections: yes
    extra_dependencies: ["float"]
    keep_md: yes
    fig_height: 8
    fig_width: 10
    df_print: kable
    includes:
      in_header: "z_preamble.tex"
      before_body: "z_beforebody.tex"
  html_document:
    toc: yes
    toc_depth: '5'
    df_print: kable
lang: "fr"
fontsize: 12pt
linestretch: 1.5
geometry: margin=1in
indent: TRUE
documentclass: article
# classoption:
# - twocolumn
bibliography: references.bib
csl: apa.csl
---
\newpage




<!-- Le manuscrit est divisé en plusieurs documents pour faciliter les modifications locales - ceux-ci sont dans le dossier du Drive. L'output complet du R Markdown (le pdf final) est en pdf dans le Drive, avec le même nom que ce fichier. Les GDoc de ce Drive servent à éditer le texte rédigé du document final : le code R sous-jacent et les analyses des données seront partagées et travaillées sur GitHub, lié localement à RStudio. Le repository GitHub en question : https://github.com/m-delem/aphantasia_project.git -->

Test pour référencer une figure, ici la Figure \ref{correlation_matrix}, ou encore la Figure \ref{k_means}.

<!-- Introduction -->







# Introduction

## Imagerie visuelle et aphantasie

L'imagerie visuelle, parfois désignée poétiquement comme le fait de "voir dans les yeux de l'esprit", désigne l'expérience visuelle quasi-perceptive d'images mentales en l'absence du stimulus externe correspondant [@monzelAphantasiaDysikonesiaAnauralia2022; @pearsonHumanImaginationCognitive2019]. L'imagerie visuelle est considérée par la plupart des gens comme un élément central de leur vie mentale quotidienne, dans la mémorisation et la récupération d'informations sur des lieux, des objets ou des personnes connus, dans le vagabondage mental et la rêverie, voire plus généralement dans la créativité [@zemanLivesImageryCongenital2015]. Il a été démontré qu'elle joue un rôle prépondérant dans de nombreux processus cognitifs, tels que la mémoire autobiographique, la mémoire épisodique et la prospection d’évènements futurs [@greenbergRoleVisualImagery2014], la mémoire de travail visuelle [@pearsonHumanImaginationCognitive2019].

Cependant, il a été démontré qu'il pouvait exister une grande variabilité interindividuelle dans l'imagerie visuelle, et que certaines personnes pouvaient même en être totalement dépourvues. L'une des toutes premières études sur l'imagerie visuelle, une enquête menée par Sir Francis Galton en 1880, a apporté les premiers témoignages de la grande variété de la capacité des gens à produire des images mentales. Son "enquête sur la table du petit-déjeuner" invitait les participants à visualiser leur table du matin et à évaluer "l'illumination, la définition et la coloration" des images mentales qu'ils en avaient. À son grand étonnement, il a découvert que certaines personnes interrogées, parmi lesquelles beaucoup de ses collègues, dans ses termes des "hommes de science", ont protesté que l'imagerie mentale leur était inconnue - tout comme les daltoniens ne pouvaient pas concevoir la nature de la couleur, ces personnes ne pouvaient pas concevoir la nature de l'imagerie mentale [@galtonSTATISTICSMENTALIMAGERY1880].     

Il est intéressant de noter que, bien qu'il y ait eu une résurgence des recherches et des débats sur l'imagerie mentale à la fin du siècle qui a suivi (e.g. @kosslynCognitiveNeuroscienceMental1995; @pylyshynMentalImagerySearch2002; @reisbergIntuitionsIntrospectionsImagery2002), cette condition d'"imagination aveugle" n'a pas suscité beaucoup d'attention. Une exception notable est Faw [-@fawConflictingIntuitionsMay2009], qui a soulevé le fait que les théories des chercheurs sur l'imagerie pourraient être fortement biaisées par leur propre expérience subjective de celle-ci. Il a indiqué que les "non-visualiseurs", ignorés par la recherche jusqu'à présent, pourraient représenter 2 à 3 % des personnes, selon son enquête (*N* = 2500). En 2010, Zeman et al. ont rapporté le cas d'un patient qui a perdu la capacité de produire des images mentales après avoir subi une intervention chirurgicale [@zemanLossImageryPhenomenology2010]. L'article a attiré l'attention du public après un reportage dans le magazine *Discovery* [@zimmerBrainLookDeep2010] : bien qu'il s'agisse apparemment d'imagination aveugle "acquise", l'article a conduit de nombreuses personnes à se reconnaître dans cette condition et à contacter l'équipe pour témoigner de leur expérience, avec la différence importante qu'elles avaient toujours eu cette absence d'imagerie. En décrivant leurs cas, Zeman et al. [-@zemanLivesImageryCongenital2015] ont créé le terme "*aphantasie*" pour décrire l'absence d'imagerie mentale.    

L'aphantasie, en tant que terme et phénomène, a attiré l'attention des médias et a entraîné une augmentation importante du nombre de personnes signalant leur cas d'imagerie extrême [@monzelAphantasiaDysikonesiaAnauralia2022]. Les études à grande échelle sur les extrêmes de l'imagerie visuelle suggèrent une prévalence de 2-4% d'aphantasie dans la population générale (@dancePrevalenceAphantasiaImagery2022 : *N* = 1004 ; @dawesCognitiveProfileMultisensory2020 : *N* = 715 ; @fawConflictingIntuitionsMay2009 : *N* = 2500 ; @palermoCongenitalLackExtraordinary2022 : *N* = 490 ; @takahashiDiversityAphantasiaRevealed2022: *N* = 2885 ; @zemanPhantasiaPsychologicalSignificance2020) avec de nombreuses variations (entre 0,5 et 11%) selon les seuils choisis pour caractériser l'affection. L'étude de l'aphantasie est récente, et bien qu'il n'existe pas actuellement de " profil " clairement défini des individus aphantasiques, la recherche a lentement assemblé plusieurs caractéristiques associées à cette condition. 

## Les corrélats de l'aphantasie

Depuis 2015, le nouveau champ scientifique de l'aphantasie a construit un corpus de divers corrélats cognitifs, comportementaux et physiologiques de l'aphantasie. Communément, l'aphantasie est évaluée dans des études à grande échelle en utilisant des auto-rapports qualitatifs et le questionnaire Vividness of Visual Imagery [@marksVividnessVisualImagery1973], même si le seuil VVIQ choisi pour caractériser les personnes ayant une faible imagerie varie selon les études (entre 16 ~ 30). En utilisant les questionnaires comme point de départ, plusieurs études expérimentales ont été en mesure de corréler une faible imagerie visuelle avec des caractéristiques distinctes. 

### Corrélats cognitifs

La plupart des études à grande échelle existantes sur l'aphantasie ont porté sur les capacités de mémoire des aphantasiques, et ont montré des corrélations entre leur faible imagerie et des déficiences en mémoire autobiographique et épisodique [@dawesCognitiveProfileMultisensory2020; @miltonBehavioralNeuralSignatures2021; @zemanPhantasiaPsychologicalSignificance2020]. Les aphantasiques, lorsqu'on leur demande d'évaluer leur mémoire autobiographique, l'évaluent le plus souvent plus bas que les témoins [@zemanLivesImageryCongenital2015; @zemanPhantasiaPsychologicalSignificance2020]. L'un de ces rapports subjectifs a fait émerger la possibilité d'une association de l'aphantasie avec les syndromes de mémoire autobiographique sévèrement déficiente [@watkinsPhantasiaSeverelyDeficient2018]. En accord avec les auto-rapports et les données neuropsychologiques sur la mémoire épisodique, Dawes et al. [-@dawesInnerVisionsMind2022] ont démontré, à l'aide de l'Autobiographical Interview, une mesure comportementale de la spécificité et de la richesse des détails épisodiques (combinant donc des évaluations subjectives et objectives) que l'aphantasie était également associée à une réduction des détails épisodiques pour les évènements passés et futurs. Leurs résultats sont également en accord avec ceux de Milton et al. [-@miltonBehavioralNeuralSignatures2021] qui ont mis en évidence une réduction de l'"imagination" temporelle et atemporelle, à savoir la capacité à simuler des évènements fictifs. L'aphantasie a également été associée à la prosopagnosie - la difficulté à reconnaître les visages [@dawesCognitiveProfileMultisensory2020; @miltonBehavioralNeuralSignatures2021; @palermoCongenitalLackExtraordinary2022; @zemanPhantasiaPsychologicalSignificance2020], et à des rêves nocturnes et diurnes qualitativement appauvris [@dawesCognitiveProfileMultisensory2020; @zemanPhantasiaPsychologicalSignificance2020].

### Corrélats comportementaux et physiologiques

Comme nous l'avons mentionné, la plupart des études sur l'aphantasie se sont appuyées sur des évaluations subjectives, des questionnaires et des rapports personnels pour identifier et évaluer la condition et l'imagerie visuelle. Bien que les phénomènes subjectifs rapportés par les aphantasiques montrent une cohérence remarquable, les rapports à la première personne et l'introspection restent faillibles [@miltonBehavioralNeuralSignatures2021; @zemanPhantasiaPsychologicalSignificance2020]. Les différences dans les jugements d'imagerie visuelle pourraient être liées à une mauvaise métacognition, résultant en une incapacité des aphantasiques à percevoir consciemment leur imagerie potentiellement effective. Pour surmonter cette limitation, de nouvelles méthodes de mesure de l'imagerie visuelle et de son absence ont été développées afin de trianguler ces auto-rapports subjectifs avec des marqueurs comportementaux et physiologiques objectifs. Ainsi, il a été démontré que les personnes atteintes d'aphantasie ne présentent pas d'amorçage par l'imagerie visuelle par rapport aux témoins en utilisant le paradigme de rivalité binoculaire basé sur les sens [@keoghAttentionDrivenPhantom2020; @keoghBlindMindNo2018] ; elles se souviennent de moins d'objets et de couleurs que les témoins à partir de scènes étudiées [@bainbridgeQuantifyingAphantasiaDrawing2021] ; ils ont montré moins de sensibilité sensorielle dans une tâche d'éblouissement de motifs visuels, ce qui suggère que l'imagerie sensorielle et la sensibilité sensorielle sont liées [@danceLessSensoryOverwhelm2022; @danceWhatLinkMental2021] ; ils n'ont pas montré de réponse de conductivité cutanée à l'imagerie émotionnelle lors de la lecture de scénarios effrayants (Wicken et al., 2019) ; et enfin, ils n'ont pas montré de réponse pupillaire à des formes claires ou sombres imaginées [@lachlanPupillaryLightResponse2022]. Ces deux derniers paradigmes en particulier ont établi les premiers indices physiologiques de la force de l'imagerie sensorielle et phénoménologique, et les premières validations physiologiques de l'aphantasie. L'investigation du phénomène de l'imagerie visuelle par ces méthodes objectives a permis de rassembler des preuves solides en faveur de la conception de l'aphantasie comme une véritable absence (ou une réduction sévère) de l'imagerie visuelle plutôt que comme un déficit métacognitif.

### L'aphantasie est elle un trouble ?

L'aphantasie a été associée dans la littérature récente à une série de déficiences et de déficits, et est donc souvent logiquement désignée comme un handicap ou un trouble (e.g. @blomkvistAphantasiaSearchTheory2022; @fox-muratonWorldImaginationConsequences2021) ; certaines revues vont jusqu'à caractériser la condition comme un ensemble de déficiences résultant d'un dysfonctionnement d'un système cognitif [@blomkvistAphantasiaSearchTheory2022]. Bien que ce point de vue puisse être justifié d'une certaine manière si l'on considère que les déficiences de l'imagerie mentale peuvent survenir à la suite de lésions cérébrales, d'opérations chirurgicales ou de troubles psychiatriques - une condition appelée "aphantasie acquise" [@bartolomeoAssessingCausalRole2020; @cavedon-taylorPredictiveProcessingPerception2021; @farahCaseStudyMental1988; @spagnaChapterVisualMental2022; @zagoCharcotBernardCase2011; @zemanLossImageryPhenomenology2010], on peut trouver à redire sur plusieurs observations dans l'aphantasie congénitale (c'est-à-dire à vie). Des preuves empiriques provenant de plusieurs études soulignent que les aphantasiques pourraient n'avoir aucune différence de performance dans divers types de tâches présumées nécessiter une imagerie visuelle.     

Tout d'abord, en contraste frappant avec les résultats suggestifs sur la mémoire épisodique, les aphantasiques ont des performances aussi précises que les témoins dans plusieurs paradigmes de mémoire de travail visuelle en laboratoire et en clinique [@keoghVisualWorkingMemory2021; @knightMemoryImageryNo2022] ; ils ont également les mêmes performances dans les tâches de mémoire clinique évaluant le rappel antérograde [@miltonBehavioralNeuralSignatures2021] et la mémoire de reconnaissance pour le matériel verbal et visuel [@bainbridgeQuantifyingAphantasiaDrawing2021; @miltonBehavioralNeuralSignatures2021] ; ils ne présentent pas de différences significatives dans les tâches de mémoire sémantique [@dawesCognitiveProfileMultisensory2020; @miltonBehavioralNeuralSignatures2021] ; de même, ils ne présentent pas de déficience de la mémoire déclarative générale ou visuelle dans une batterie de tests neuropsychologiques [@pounderOnlyMinimalDifferences2022]. Keogh et al. [-@keoghVisualWorkingMemory2021] soulignent également dans leur étude le fait que les performances des aphantasiques dans les tâches d'imagerie visuelle peuvent s'appuyer sur des stratégies différentes, sur la base des différences notables entre leurs stratégies rapportées, et corroborées par une absence d'effet d'orientation dans leurs réponses, supposé se produire en raison du recrutement sensoriel.      

Pris ensemble, ces résultats suggèrent que les aphantasiques ne présentent pas de problèmes de mémoire de travail, de reconnaissance ou de mémoire déclarative (générale ou visuelle) qui pourraient s'avérer affecter leur vie quotidienne. Ils reflètent également le fait que ces performances pourraient s'appuyer sur des stratégies alternatives non visuelles tout aussi adaptées pour résoudre des problèmes supposés auparavant nécessiter une imagerie visuelle. Ceci plaide pour considérer que les aphantasiques utilisent des approches alternatives qui pourraient ne pas être uniquement de la compensation, mais un tout autre " mode de fonctionnement humain du traitement de l'information " [@zemanPhantasiaPsychologicalSignificance2020] : si nous adhérons à ce point de vue, les spécificités des différences entre ces modes restent encore à déterminer. 

### Expériences de vie et "styles cognitifs"

En accord avec le fait que leur vie quotidienne ne semble pas être affectée par leur état, les aphantasiques sont le plus souvent inconscients de leur état, qui est de la même manière invisible pour les gens, puisqu'ils ne vivent apparemment pas différemment de n'importe qui d'autre [@kendleAphantasiaExperiencesPerceptions2017; @zemanLivesImageryCongenital2015]. Bien qu'il n'existe pas, à ce jour, d'étude systématique du profil démographique des aphantasiques, les résultats préliminaires d'une étude récente [@zemanPhantasiaPsychologicalSignificance2020] apportent un éclairage sur les préférences professionnelles potentielles des personnes dotées d'imageries extrêmes. En effet, les données des questionnaires de milliers de participants sur l'imagerie visuelle ont révélé que les extrêmes de ce spectre présentaient des associations comportementales et psychologiques distinctes, y compris des préférences professionnelles : alors que les personnes présentant une imagerie visuelle extrêmement élevée (appelées "hyperphantasiques") avaient tendance à travailler dans des professions traditionnellement considérées comme "créatives" (à savoir les arts, le design, le divertissement et la communication), les aphantasiques étaient plus susceptibles de travailler dans l'informatique, les mathématiques et les sciences [@crowderDifferencesSpatialVisualization2018; @zemanPhantasiaPsychologicalSignificance2020]. Ces résultats apportent un autre argument, d'un point de vue comportemental plus large, vers l'idée d'une tension entre deux "styles cognitifs" [@kozhevnikovSpatialObjectVisualizers2005], et une vision de l'aphantasie et de l'hyperphantasie comme des conditions équilibrées, avec des avantages et des inconvénients [@zemanPhantasiaPsychologicalSignificance2020].       

Bien que les affirmations initiales de Galton selon lesquelles les "hommes de science" manquaient d'imagerie mentale aient été contestées depuis et qu'il ait été démontré qu'il s'agissait d'une extension excessive de son observation de quelques répondants particulièrement inhabituels parmi ses collègues scientifiques [@brewerScientistsAreNot2006], son récit reste intéressant d'un point de vue opposé : Si les aphantasiques sont effectivement très peu nombreux, comme l'ont montré des données plus récentes, ont-ils vraiment tendance à se tourner vers les domaines scientifiques ? Les premiers résultats concernant les aphantasiques semblent corroborer cette intuition. Pourtant, quelles bases cognitives pourraient sous-tendre ces différentes stratégies mentales des aphantasiques et ces apparentes affinités intellectuelles ? Quelle est la nature des différents "modes" supposés de traitement de l'information visuelle ?

## La disctinction entre imagerie visuelle-objet et visuospatiale

Une hypothèse est que cette dualité reposerait sur la distinction fondamentale, dans l'imagerie visuelle, entre deux composantes, l'imagerie visuelle-objet (c'est-à-dire la représentation mentale des caractéristiques visuelles d'un objet telles que la forme, la luminosité ou la couleur) et l'imagerie visuelle-spatiale (c'est-à-dire la représentation mentale des emplacements spatiaux et des relations entre les parties d'un objet).

### Voies ventrales et dorsales dans la perception et l'imagerie visuelle

La distinction entre le traitement des objets et le traitement spatial a d'abord été introduite pour la perception visuelle [@mishkinContributionStriateInputs1982], puis proposée pour la mémoire de travail visuelle [@dellasalaPatternSpanTool1999; @salwayVisuospatialWorkingMemory1995]. Il a été démontré que le traitement visuel de plus haut niveau est divisé en deux voies distinctes sur le plan fonctionnel et anatomique : la voie ventrale, qui va du lobe occipital au lobe temporal inférieur et qui traite les propriétés des objets (couleurs, forme, luminosité), et la voie dorsale, qui va du lobe occipital au lobe pariétal postérieur et qui traite les propriétés spatiales. Sur la base de données comportementales, neuropsychologiques et de neuroimagerie [@blajenkovaObjectspatialImageryNew2006; @bocciaPennyYourThoughts2015; @kozhevnikovRevisingVisualizerVerbalizerDimension2002; @kozhevnikovSpatialObjectVisualizers2005; @mortonImageTransformationDissociated1995; @palermoCongenitalLackExtraordinary2022], une distinction objet-spatial similaire a été suggérée pour l'imagerie visuelle. Ce contexte théorique a conduit au développement et à la validation d'un questionnaire permettant d'évaluer ces deux aspects de l'imagerie visuelle, l'Object and Spatial Imagery Questionnaire (OSIQ : @blajenkovaObjectspatialImageryNew2006).

### L'imagerie objet et spatiale chez les aphantasiques

Dans ce cadre, cette distinction entre imagerie objet et imagerie spatiale pourrait être centrale pour la compréhension de l'aphantasie : les cas étudiés jusqu'à présent sont-ils dépourvus d'imagerie visuelle objet, spatiale ou les deux ? Un résultat expérimental remarquablement cohérent dans toutes les études récentes sur l'aphantasie est l'imagerie spatiale préservée des aphantasiques, par opposition à leur imagerie d'objet altérée. En utilisant l'OSIQ, plusieurs études ont montré qu'il n'y avait pas de différence significative entre les aphantasiques et les témoins sur les items d'imagerie spatiale [@bainbridgeQuantifyingAphantasiaDrawing2021; @dawesCognitiveProfileMultisensory2020; @keoghBlindMindNo2018; @miltonBehavioralNeuralSignatures2021; @zemanPhantasiaPsychologicalSignificance2020]. Les aphantasiques ont obtenu des résultats précis au test des mannequins et aux tâches de rotation mentale, impliquant la rotation mentale d'avatars ou d'objets [@crowderDifferencesSpatialVisualization2018; @miltonBehavioralNeuralSignatures2021; @pounderOnlyMinimalDifferences2022] - bien que Pounder et al. [-@pounderOnlyMinimalDifferences2022] aient signalé des temps de réponse plus lents pour les aphantasiques à très faible imagerie. Zeman et al. [-@zemanPhantasiaPsychologicalSignificance2020] rapportent que, lorsqu'on leur demande d'imaginer et de compter les fenêtres de leur maison, les personnes ayant une imagerie élevée ou moyenne s'appuient systématiquement sur l'imagerie visuelle, tandis que les aphantasiques utilisent diverses autres stratégies : visualisation ou mémoire spatiale, imagerie alternative (kinesthésique, auditive, etc.), traitement sémantique ou " connaissances " amodales. De même, Bainbridge et al. [-@bainbridgeQuantifyingAphantasiaDrawing2021] ont observé que, lorsqu'on leur demande de dessiner de mémoire une scène vue précédemment, les aphantasiques se souviennent de beaucoup moins d'objets et de façon moins détaillée que les témoins, mais avec des tailles, des emplacements et une organisation corrects, voire plus précis. Ensemble, ces résultats suggèrent que les "aphantasiques" actuellement les plus étudiés sont en fait des aphantasiques "objets", avec une imagerie visuospatiale intacte.       

Ce phénomène pourrait être lié au fait que les individus aphantasiques ont été principalement identifiés à l'aide du VVIQ [@marksVividnessVisualImagery1973], qui est corrélé positivement avec l'échelle objet de l'OSIQ, mais pas avec l'échelle spatiale, ni avec les tâches d'imagerie spatiale [@blajenkovaObjectSpatialImagery2006; @blajenkovaObjectspatialImageryNew2006; @blazhenkovaTwoEyesBlind2019; @blazhenkovaVisualobjectAbilityNew2010]. Le VVIQ permettrait donc de détecter sélectivement les déficiences de l'imagerie visuelle des objets, mais pas de l'espace. À ce titre, Blazhenkova et Pechenkova [-@blazhenkovaTwoEyesBlind2019] ont émis l'hypothèse qu'il pourrait exister deux types d'imagerie extrême (potentiellement congénitale) : l'aphantasie des objets d'une part, et l'aphantasie spatiale d'autre part (et inversement, deux types d'hyperphantasie). Dans une étude récente examinant pour la première fois cette hypothèse de manière systématique, Palermo et al. [-@palermoCongenitalLackExtraordinary2022] ont rassemblé des preuves très prometteuses de l'existence d'aphantasies et d'hyperphantasies objectales et spatiales, en utilisant l'OSIQ et des questionnaires évaluant plusieurs compétences. Elles ont également montré que les deux sous-types d'aphantasie étaient associés à des modèles différents de difficultés cognitives : les aphantasiques "objet", comme nous l'avons vu précédemment, ont montré des difficultés à imaginer des objets et à reconnaître des visages, tandis que les aphantasiques "spatiaux" avaient des problèmes avec les tâches d'imagerie mentale visuospatiale et le sens de la direction - un modèle opposé de performances a été observé pour les deux types d'hyperphantasie. 

### Des styles cognitifs équilibrés entre imagerie objet et spatiale

Ces résultats sur l'imagerie d'objet et spatiale introduisent une deuxième dimension (spatiale) significative dans l'imagerie visuelle et la recherche sur l'aphantasie, qui semble afficher des modèles opposés à la composante (objet) qui a été distinguée dans les études précédentes : avoir ces deux axes permet d'envisager une possibilité pour le profil " équilibré " hypothétique de l'aphantasie, qui pourrait être basé sur un équilibre entre les méthodes de représentation mentale visuelle-objet et visuelle-spatiale.       

Des résultats intéressants dans la littérature sur l'imagerie spatiale semblent faire écho aux premiers résultats de Zeman et al. [-@zemanPhantasiaPsychologicalSignificance2020] sur les préférences professionnelles des aphantasiques (objet). Les hautes performances dans les tests de visualisation spatiale sont corrélées aux performances professionnelles et académiques dans divers domaines STEM, notamment la physique, la chimie organique, la géologie, les mathématiques, ainsi que la chirurgie, l'architecture et le raisonnement mécanique [@colemanSpatialPerceptionSkills1998; @hegartyIndividualDifferencesSpatial2005; @keehnerSpatialAbilityExperience2004; @kozhevnikovSpatialVisualizationPhysics2007; @orionRelationshipEarthScienceEducation1997; @waiSpatialAbilitySTEM2009]. D'autres études ont mis en évidence que la réussite dans les STEM reposait sur des capacités fondamentales d'imagerie spatiale telles que l'imagination de structures schématiques ou l'exécution de transformations spatiales mentales [@kozhevnikovSpatialVisualizationPhysics2007; @waiSpatialAbilitySTEM2009]. Ces considérations jettent également un nouvel éclairage sur les observations et les intuitions de Galton [-@galtonSTATISTICSMENTALIMAGERY1880] concernant les scientifiques. Blajenkova et al. [@blajenkovaObjectSpatialImagery2006] ont proposé une explication avec le clivage objet-spatial : les scientifiques ne seraient pas complètement déficients en imagerie visuelle générale, comme le suggérait Galton, mais seraient seulement sélectivement déficients en imagerie visuelle objet.       

En outre, les recherches sur les différences individuelles en matière d'imagerie ont démontré que les scientifiques et les ingénieurs ont tendance à être des imageurs spatiaux tandis que les artistes visuels ont tendance à être des imageurs objet [@blajenkovaObjectSpatialImagery2006; @blazhenkovaNewObjectspatialverbalCognitive2009; @blazhenkovaVisualobjectAbilityNew2010; @kozhevnikovSpatialObjectVisualizers2005; @kozhevnikovTradeoffObjectSpatial2010]. Ces études ont non seulement montré, par le biais de rapports subjectifs, que les artistes et les scientifiques différaient en termes d'imagerie, mais elles ont également mis en évidence des différences de performance : les artistes ont obtenu de meilleurs résultats dans les tâches nécessitant la visualisation d'objets (par exemple, la création de représentations d'images et de couleurs, l'identification d'objets dégradés) ; tandis que les visualiseurs spatiaux et les scientifiques ont obtenu de meilleurs résultats dans les tâches nécessitant une visualisation spatiale (par exemple, la rotation mentale, le pliage de papier, la recherche d'un emplacement). Enfin, Kozhevnikov et al. [@kozhevnikovCreativityVisualizationAbilities2013] ont constaté que les évaluations de l'imagerie de visualisation d'objets par rapport à celle de visualisation spatiale étaient respectivement et sélectivement associées aux évaluations de créativité artistique par rapport à celle de créativité scientifique. 

### Un "trade-off" entre imagerie objet et spatiale chez les aphantasiques ?

Une question ouverte reste celle du lien potentiel entre l'imagerie visuelle objet et spatiale, et plus particulièrement ici dans les cas d'aphantasie. Les voies ventrales et dorsales régissant ces deux aspects étant connues pour être fonctionnellement et anatomiquement différentes [@mishkinContributionStriateInputs1982], il a longtemps été considéré que les deux processus visuels objet et spatial étaient des composantes mutuellement indépendantes de la représentation et de l'imagerie [@farahCaseStudyMental1988; @mishkinContributionStriateInputs1982]. Néanmoins, Kozhevnikov et al. [@kozhevnikovTradeoffObjectSpatial2010] ont montré, sur cinq groupes d'âge différents et quatre groupes de spécialisation différents, que les artistes visuels avaient des capacités de visualisation d'objets supérieures à la moyenne mais des capacités de visualisation spatiale inférieures à la moyenne, tandis que les scientifiques présentaient le schéma inverse. Aucun des groupes professionnels (artistes, scientifiques, architectes ou spécialistes des sciences humaines) ne présentait à la fois des capacités de visualisation d'objets et des capacités de visualisation spatiale supérieures à la moyenne : il a donc été proposé qu'il pouvait y avoir un compromis entre les capacités de visualisation d'objets et les capacités de visualisation spatiale. Comme l'étude a montré que les scores d'imagerie globale (spatiale + objet) étaient relativement homogènes chez tous les participants, ce compromis impliquerait l'existence d'un "goulot d'étranglement" dans la quantité totale des capacités d'imagerie, qui nécessiterait leur affectation en fonction de l'activité de chacun. Par conséquent, on peut supposer qu'un tel compromis pourrait exister, dans le cas de l'aphantasie, entre les ressources objet et spatiales : les aphantasiques objet, les cas d'aphantasie les plus étudiés, pourraient potentiellement compenser cette imagerie objet réduite par une imagerie spatiale plus vive - une possibilité qui, jusqu'à présent, n'a pas été étudiée en profondeur en raison de l'accent mis sur la composante objet singulière de l'aphantasie.        

La dualité de l'imagerie visuelle entre l'objet et l'espace, l'existence proposée de formes spécifiques d'images extrêmes qui leur sont associées, et la distinction apparente des profils cognitifs entre les visualiseurs "objet" et les visualiseurs "espaces"spatiaux", soutiennent l'hypothèse que les aphantasies soient des conditions équilibrées. Elles pourraient avoir leurs propres avantages et inconvénients qui pourraient être répartis sur plusieurs dimensions : parmi lesquelles le traitement visuel-objet ou visuospatial, mais peut-être aussi le traitement verbal, en accord avec les modèles précédemment développés de styles cognitifs Objet-Spatial-Verbal [@blazhenkovaNewObjectspatialverbalCognitive2009], et comme l'ont supposé Zeman et al. [@zemanPhantasiaPsychologicalSignificance2020].

<!-- Sema

## Stratégies et mécanismes de compensation possibles dans l'aphantasie

	Galton (1880) : Il remarquait déjà que les hommes de science qu'il avait interrogés présentaient des capacités de visualisation plus faibles que la population tout venant. L'explication apportée est la suivante : une forte tendance à percevoir des images mentales claires serait antagoniste à l'acquisition d'habitudes de pensées abstraites et généralisées. Par ailleurs, Galton notait que ces grands esprits qui manquaient d'imagerie mentale pouvaient tout de même donner des descriptions précises de scènes visuelles. Il pensait que cette capacité manquante pouvait être remplacée par d'autres modes de conception, notamment des modes de pensées liés au sens moteur. 
	Zeman et al. (2015) : les aphantasiques pourraient avoir développé des stratégies compensatrices dans les domaines verbaux, mathématiques et logiques
	Zeman et al. (2020) : sur-représentation d'aphantasiques (comparés à un groupe d'hyperphantasiques) dans les professions scientifiques, mathématiques et informatiques. Utilisation de stratégies alternatives pour résoudre la tâche de comptage du nombre de fenêtres chez soi : recours à l'imagerie spatiale non-visuelle, à l'imagerie kinesthésique, et aux connaissances amodales. Il fait l'hypothèse d'un traitement de l'information préférentiellement sémantique et factuel chez les aphantasiques.
	Knauff et Johnson-Laird (2002) : Etude du raisonnement en fonction de la facilité pour construire des modèles mentaux spatiaux. Les 3 expériences montrent que les relations visuelles ralentissent le processus de raisonnement par rapport aux relations spatiales, visuospatiales et contrôles. Ils concluent que les détails visuels sans importance peuvent être gênants pour le raisonnement et donc que cela peut entraver le processus.
	Junichi et Jiro (2020) : étude de cas d'un aphantasique via questionnaires. Le participant présentait des capacités d'imagerie auditive préservée et rapportait avoir recours à une compensation verbale
	Gangczarek et al. (2020) : Etude de cas d'une aphantasique : au questionnaire OSIVQ, la participante présente un score très faible dans la composante "imagerie d'objet" alors que les sous scores spatiaux et verbaux sont dans la norme, témoignant d'une préférence pour le raisonnement spatial et verbal. Malgré son aphantasie, elle présente des scores dans la norme en MDT visuospatiale. Le QIT est élevé (128), avec une différence significative entre le QI verbal et le QI performance, au profit du verbal (138 et 114).
	Milton et al. (2021) : les participants aphantasiques présentent un QI plus élevé que les participants hyperphantasiques (petits échantillons)

	Fonctions exécutives = moyens de compenser des difficultés, de s'adapter, permettant de développer de nouvelles stratégies


## Images mentales et lecture

Hypothèse que la lecture implique des images mentales
	Modèle mental, Johnson-Laird
	Suggate et Lenhard  (2022) : 3 expériences (n = 155, 452 et 236). Les résultats montrent que la mesure objective de l'imagerie mentale visuelle est corrélée avec les performances en lecture, alors que les auto-évaluations subjectives (questionnaires) ne montraient pas de lien avec la lecture. De plus, la compréhension en lecture était plus fortement associée à l'imagerie mentale que la vitesse de lecture. Les résultats montrent donc pour la première fois que les processus d'imagerie mentale sont intrinsèquement liés aux performances en lecture. Autrement dit : l'imagerie mentale mesurée par l'ICT est un prédicteur significatif de la compréhension en lecture (// cognition incarnée, modèle mental)
L'utilisation d'une tâche écologique impliquant les images mentales pourrait être intéressante.
	Magyari et al. (2020) : L'objectif était d'étudier la contribution de l'imagerie mentale dans la lecture de textes littéraires à travers une méthodologie d'eye-tracking. Dans cette expérience, les lecteurs rencontraient plus de difficultés pour produire des images mentales lorsqu'ils lisaient un texte principalement descriptif que lorsqu'ils lisaient un texte principalement énactif (représentations liées à l'action). Des temps de fixation plus longs étaient corrélés au texte énactif. Les auteurs suggèrent que le style énactif mobilise davantage les processus d'imagerie, ce qui se traduirait dans le comportement oculaire des participants.
	Brehm (2011) : rôle essentiel de l'image pour créer du sens, la lecture est comparée à une simulation, simulation à laquelle on a recours quand on se remémore des souvenirs du passé ou à l'imagination du futur (qui est altérée chez les aphantasiques)
"Gilles Thérien, par exemple, souligne très justement que toute lecture littéraire est «un travail d’imagination» et de construction permettant à un sujet «d’investir, dans un mouvement qui va de l’intérieur vers l’extérieur, [s]es images sous les mots du texte"

## Objectif

Pour la plupart des gens, les images mentales sont omniprésentes dans la vie quotidienne. Mais pour certaines personnes, l'expérience de l'imagerie visuelle fait défaut, une condition récemment appelée aphantasie. Les images mentales sont impliquées dans de nombreux processus cognitifs, comme la mémoire autobiographique, l’imagination du futur, la mémoire de travail visuospatiale, la compréhension du langage, le raisonnement moral, ou encore les rêves. A l’inverse on peut imaginer que certaines tâches soient gênées par la création d’images mentales, par exemple des tâches qui nécessitent des représentations plus abstraites, comme la catégorisation ou le raisonnement analogique. Il existe encore très peu d’études qui cherchent à caractériser le profil cognitif des personnes aphantasiques. L’objectif du présent projet est de mesurer les performances des personnes aphantasiques dans différents domaines cognitifs. 
Premièrement il s’agira de mieux comprendre le profil cognitif de ces personnes. Si les images mentales sont un frein au raisonnement abstrait, on peut s’attendre à ce que les personnes aphantasiques soient meilleures dans des tâches de catégorisation et de raisonnement. Les performances à ces tâches devraient également être inversement corrélées aux scores d’imagerie mentale (VVIQ etc).  
Deuxièmement, il sera question de mettre en relation leur fonctionnement cognitif avec des tâches nécessitant de l’imagerie mentale mais pas nécessairement échoué par les A. Dans quelle mesure performent-ils à une tâche cognitive écologique censée solliciter la création d’images mentales : la compréhension de texte ? Et dans quelle mesure, la performance à cette tâche sera reliée à la mise en place de stratégies différentes. Si c’est le cas, une bonne performance à ces tâches devrait être liée à un fonctionnement exécutif et intellectuel plus élevé. 

Pourquoi est-ce que les stratégies différentes seraient forcément associées à un fonctionnement exécutif et intellectuel plus élevé ? On pourrait faire l’hypothèse que les aphantasiques utilisent simplement d’autres modalités cognitives associées plastiquement à des tâches supposées requérir de l’imagerie uniquement visuelle.
Faire attention aux covariances : l’imagerie spatiale par ex. a été liée aux capacités en sciences, au raisonnement, à la réussite académique, etc.
Donc rien que sur ça, le domaine d’activité, le niveau d’études, le QI, etc. sont des facteurs confondants – à préciser

-->




\newpage
<!-- Méthodologie -->






# Expérience

## Méthode

### Participants

<!-- Sema

Soixante personnes ont participé à l'expérience. Ils devaient avoir entre 18 et 50 ans, être locuteurs français natifs, avoir une vision normale ou corrigée et ne pas présenter de trouble de la lecture.
Les participants étaient divisés en deux groupes : les aphantasiques (n=30) et les non-aphantasiques (n=30). Les participants aphantasiques ont été recrutés en ligne sur des espaces spécifiques à leur condition (forums, groupes sur les réseaux sociaux, etc.).

-->

### Matériel expérimental

#### Questionnaires

<!-- sema

Le matériel était constitué de 6 épreuves neuropsychologiques, mesurant les capacités de raisonnement visuel et d'induction et de déduction de règles (version courte des matrices de Raven (Bilker et al., 2012), les capacités d'abstraction et de conceptualisation verbale (Subtest Similitudes de la WAIS-IV), la mémoire de travail verbale (Empan de chiffre envers), les fonctions exécutives (Test à préciser) et les capacités de compréhension en lecture (Texte, à décider). Cette dernière épreuve constituait une tache écologique dans laquelle les images mentales pouvaient être sollicitées. Enfin, une courte tâche de raisonnement était également proposée (Tâche de Wason, 1968). 
L'expérience comprenait aussi 2 questionnaires : le VVIQ, Questionnaire de Vivacité de l'Imagerie Visuelle (Marks, 1973), qui comporte 16 items et dans lequel le participant doit coter sur une échelle de Likert de 5 points l'énoncé qui lui correspond le mieux. Les scores vont de 16 à 80. Il constitue le questionnaire subjectif de référence dans l'aphantasie. Le second questionnaire était le MAI, Inventaire de Conscience Métacognitive (Schraw & Dennison, 1994), qui évalue les deux composantes de la métacognition : les connaissances métacognitives et la régulation métacognitive.

-->
### Equipement

<!-- Sema

L’expérience a été développée à l’aide d’OpenSesame puis a été présentée en ligne sur un serveur JATOS (Lange et al, 2015).

--> 

### Procédure expérimentale
 <!-- Sema
 
Le participant effectuait les différentes épreuves neuropsychologiques. (Ordre des épreuves non décidé). Concernant la tâche de lecture, les participants étaient soumis à un texte qu'ils devaient lire. Le temps de lecture est libre mais chronométré. A la fin de la lecture, le texte est caché. Les participants devaient ensuite répondre à des questions sur le texte qui étaient d'ordres explicite ou implicite.
A la fin de la passation de l'ensemble des tests, le participant répondait au questionnaire sur la vivacité de l'imagerie visuelle (VVIQ) et au questionnaire de métacognition (MAI). Pour terminer l'expérience, un questionnaire démographique a été rempli.

-->

## Variables et hypothèses

### Variables indépendantes

<!-- Sema

Groupe : aphantasiques et non-aphantasiques

-->

### Variables dépendantes

<!-- Sema 
Les VD sont les suivantes : 
-	Score aux Matrices
-	Score au test des Similitudes
-	Empan en MDT ou % de bonnes réponses ?
-	Score au texte de compréhension en lecture
-	Score à l'épreuve évaluant les fonctions exécutives
-	Pourcentage de réussite à la tâche de Wason pour chaque groupe
-	Score au VVIQ
-	Score au questionnaire MAI
-->

### Hypothèses opérationnelles

<!-- Sema

1)	D'après les données présentées par l'étude de Zeman et al. (2020) (taux important d'aphantasiques dans les métiers scientifiques), on peut faire l'hypothèse que le groupe de participants aphantasiques présentera des capacités de raisonnement (mesurées par le test des Similitudes et les Matrices) plus développés que le groupe de participants non aphantasiques.

2)	Dans la mesure où les aphantasiques ont un défaut d'imagerie visuelle, si le texte de compréhension en lecture sollicite des images visuelles, on peut s'attendre à des performances différentes à ce texte entre les aphantasiques et les non aphantasiques.

3)	Conformément à l'hypothèse que les aphantasiques auraient recours à des stratégies pour compenser leur déficit en imagerie visuelle, des performances élevées en compréhension de texte pourraient être corrélées à des scores élevés aux épreuves mesurant le fonctionnement exécutif et les capacités d'abstraction.

Plan expérimental : S30<G2>
-->

## Résultats

### Analyses

<!-- Sema
L'analyse des résultats sera effectuée avec le logiciel JASP (Love et al., 2019). Des t-students et des ANOVAs seront menés en premier lieu afin d'observer s'il existe des différences dans les VD entre les aphantasiques et les non-aphantasiques. Des analyses corrélationnelles (Bravais-Pearson) seront ensuite effectuées sur les différentes mesures, ainsi que des régressions. Les données seront ensuite soumises à des analyses par clusters.
-->

### Corrélations entre les variables mesurées
```{=latex}
\begin{figure}[H]
``` 

\begin{center}\includegraphics[width=0.8\linewidth,height=0.5\textheight,]{aphantasia_project_files/figure-latex/correlation_matrix-1} \end{center}
```{=latex}
\caption{Matrice de corrélation entre les variables mesurées.}
\label{correlation_matrix}
\end{figure}
``` 

<!--
```{=latex}
\begin{figure}[H]
``` 

\begin{center}\includegraphics[width=0.8\linewidth,height=0.5\textheight,]{aphantasia_project_files/figure-latex/mixed_matrix-1} \end{center}
```{=latex}
\caption{Matrice présentant les distributions des variables, l'analyse de leurs corrélations et les représentations associées.}
\label{mixed_matrix}
\end{figure}
``` 
-->

### Analyses des groupes par partition non-supervisée

```{=latex}
\begin{figure}[H]
``` 

\begin{center}\includegraphics[width=0.8\linewidth,height=0.5\textheight,]{aphantasia_project_files/figure-latex/cluster_number-1} \end{center}
```{=latex}
\caption{Graphique représentatant l'évalution du nombre idéal de clusters par la méthode 'Within Sum of Squares'.}
\label{cluster_number}
\end{figure}
``` 

```{=latex}
\begin{figure}[H]
``` 

\begin{center}\includegraphics[width=0.8\linewidth,height=0.5\textheight,]{aphantasia_project_files/figure-latex/pca_variables-1} \end{center}
```{=latex}
\caption{Représentation de l'analyse en composantes principales des variables mesurées.}
\label{pca_variables}
\end{figure}
``` 

```{=latex}
\begin{figure}[H]
``` 

\begin{center}\includegraphics[width=0.8\linewidth,height=0.5\textheight,]{aphantasia_project_files/figure-latex/k_means-1} \end{center}
```{=latex}
\caption{Représentation des clusters reconnus par la méthode des 'k-means', selon les deux composantes principales de l'ACP.}
\label{k_means}
\end{figure}
``` 

### Analyse des clusters

```{=latex}
\begin{figure}[H]
``` 

\begin{center}\includegraphics[width=0.8\linewidth,height=0.5\textheight,]{aphantasia_project_files/figure-latex/cluster_repatition-1} \end{center}
```{=latex}
\caption{Répartion des groupes par cluster.}
\label{cluster_repatition}
\end{figure}
``` 

```{=latex}
\begin{figure}[H]
``` 

\begin{center}\includegraphics[width=0.8\linewidth,height=0.5\textheight,]{aphantasia_project_files/figure-latex/profiles_radar-1} \end{center}
```{=latex}
\caption{Diagramme représentatant les profils cognitifs associés à chaque cluster, selon quatre dimensions principales : l'imagerie visuelle-objet, l'imagerie visuo-spatiale, le raisonnement et les fonctions exécutives.}
\label{profiles_radar}
\end{figure}
``` 

```{=latex}
\begin{figure}[H]
``` 

\begin{center}\includegraphics[width=0.8\linewidth,height=0.5\textheight,]{aphantasia_project_files/figure-latex/profiles_lollipop-1} \end{center}
```{=latex}
\caption{Représentation alternative des profils cognitifs associés aux clusters.}
\label{profiles_lollipop}
\end{figure}
``` 

### Différences entre les groupes identifiés
```{=latex}
\begin{figure}[H]
``` 

```
## [1] FALSE
```



\begin{center}\includegraphics[width=0.8\linewidth,height=0.5\textheight,]{aphantasia_project_files/figure-latex/object_img_violins-1} \end{center}
```{=latex}
\caption{Comparaison des moyennes de score d'imagerie visuelle-objet entre les quatre groupes identifiés.}
\label{object_img_violins}
\end{figure}
``` 

<!--
```{=latex}
\begin{figure}[H]
``` 

```
## [1] FALSE
```



\begin{center}\includegraphics[width=0.8\linewidth,height=0.5\textheight,]{aphantasia_project_files/figure-latex/spatial_img_violins-1} \end{center}
```{=latex}
\caption{Comparaison des moyennes de score d'imagerie visuospatiale entre les quatre groupes identifiés.}
\label{spatial_img_violins}
\end{figure}
``` 
-->

\newpage
<!-- Discussion -->






# Discussion

\newpage
# Références {-}

<div id="refs"></div>

\newpage
# Annexes {-}
Code complet des analyses :

```r
# 
# ---- Aphantasia Project - Source code ----------------------------------------
# 
# Delem, Fourment, Junoy, Leal De Almeida
# Email : m.delem@univ-lyon2.fr
# Last update : February 11, 2022

# ---- setup -------------------------------------------------------------------

# packages
shelf(
  MASS,       # functions and data frame ecosystem
  easystats,  # modelling, visualization and reporting ecosystem
  ez,         # analysis and visualization of factorial exp
  rstatix,    # pipe friendly statistical functions
  scale,      # scale functions
  corrr,      # correlations
  lme4,       # mixed models
  lmerTest,   # tests in lmer
  cluster,    # cluster analysis
  factoextra, # multivariate data analysis visualization
  GGally,     # more ggplot2 plots
  ggpubr,     # publication plots
  ggradar,    # radar charts
  ggraph,     # auto graph layout
  igraph,     # network graphs
)

# global theme
theme_set(theme_bw(base_size = 14, base_family = "serif"))

# random seed
set.seed(14051998)

# Simulation des donnees

# definition des variables et groupes
# groupe non-aphantasique
Non_A <- data.frame(
  name = c("OSIQ_O", "OSIQ_S", "VVIQ",
           "Raven", "Simili", "Wason",
           "Empan_MDT", "WCST", "Lecture",
           "Corsi","MRT", "SRI"),
  mean = c(54.6,  46.2,  63.8,
           20.9,  37.8,  32.2,
           6.43,  32.1,  50.2,
           5.81,  16.5,  35.7),
    sd = c(8.45,  9.54,  9.67,
           5.34,  4.25,  3.78,
           2.12,  5.32,  8.89,
           1.87,  3.54,  6.23),
  group = ("Non_A") %>% factor(),
  n_subjects = 200
)

# groupe aphantasique
Aph <- data.frame(
  name = c("OSIQ_O", "OSIQ_S", "VVIQ",
           "Raven", "Simili", "Wason",
           "Empan_MDT", "WCST", "Lecture",
           "Corsi","MRT", "SRI"),
  
  mean = c(32.5,  58.9,  30.2,
           23.6,  42.2,  36.1,
           7.53,  33.8,  48.4,
           6.8,   18.2,  38.5),
  
    sd = c(8.45,  9.54,  9.67,
           4.24,  6.15,  3.47,
           1.45,  2.62,  9.67,
           1.65,  5.78,  8.21),
  group = ("Aph") %>% factor(),
  n_subjects = 200
)

# dataset fusionné
variables <- bind_rows(Aph,Non_A)
rm(Aph,Non_A)

# liens variables-capacites cognitives
fmodel <- matrix(c ( .8,   0,  0,  0,  0, # OSIQ-O = img objet
                      0,  .9,  0,  0,  0, # OSIQ-S = img spatiale
                     .9,   0,  0,  0,  0, # VVIQ = img objet
                     .1,  .3, .8,  0,.05, # Raven = raisonnmt > img s/o > flex
                    -.2,   0, .6,  0, .1, # Simili = raisonnmt >  flex
                    -.1,   0, .3,  0,  0, # Wason = raisonnmt
                      0,   0,  0, .8,  0, # Empan = MDT 
                    -.1,   0, .2,  0, .6, # WCST = Flex > raisonnmt
                     .4,   0, .6,  0,  0, # Lecture = img objet > raisonnmt
                     .1,  .7,  0, .8,  0, # Corsi = MDT > img s
                     .2, .85,  0,  0,  0, # MRT = img s
                     .1,  .9,  0,  0,  0  # SRI = img s
                    ), 
                 nrow=12, ncol=5, byrow=TRUE)

# liens entre capacites cognitives
effect <- matrix(c (  1,-.1,-.1, .2,  0, # img o
                    -.1,  1, .3, .2,  0, # img s
                    -.1, .3,  1,  0, .2, # raisonnmt
                     .2, .2,  0,  1,  0, # MDT
                      0,  0, .2,  0,  1  # flex
                     ),
                 nrow=5, ncol=5, byrow=TRUE)

# fonction de simulation
simulation <- function(variables, fmodel, effect) {
  
  ### preparatifs ###
  n_variables <- dim(fmodel)[1] # notre nb de mesures/variables (rows)
  n_skills <- dim(fmodel)[2]    # les capacites sous-jacentes evaluees (columns)
  
  # matrice de poids des erreurs
  errorweight <- (1 - diag(fmodel %*% t(fmodel))) %>% 
                  abs() %>%   # necessaire pour la racine carree
                  sqrt() %>%  # doit avoir des arguments positifs
                  diag()      # recree une matrice diagonalisee
  
  # initialisation d'un dataframe vide
  data <- data.frame()
  
  ### simulation ###
  for (i in levels(variables$group)){   # on simule separement chaque groupe
    
    var_group = variables %>% filter(group == i) # donnees du groupe isolees
    n_subjects = var_group$n_subjects[1]         # nb de sujets dans le groupe
    group = i                                    # nom du groupe
    
    # generation de scores aleatoires normaux pour chaque capacite cognitive
    randomscores <- matrix(rnorm(n_subjects * (n_skills)),
                           nrow = n_subjects,
                           ncol = n_skills)
    # ponderation par la matrice d'effets = les scores sont desormais correles
    # entre eux
    skillscores <- randomscores %*% effect
    
    # genere les valeurs standardisees des mesures/variables grace a fmodel 
    observedscores <- skillscores %*% t(fmodel)
    
    # generation d'erreurs normales pour chaque mesure/variable
    randomerror <- matrix(rnorm(n_subjects * (n_variables)), 
                          nrow = n_subjects,
                          ncol = n_variables)
    # ponderation par notre matrice de poids des erreurs
    error <- randomerror %*% errorweight
    
    # nos mesures effectives = les valeurs reeles + une erreur standard
    measures <- observedscores + error
    
    # on cree un dataframe avec le nom de groupe
    data_group <- data.frame(measures) %>% 
      mutate(Group = group %>% factor())
    
    # ajout des valeurs reeles de moyenne et d'ecart-type pour chaque variable 
    # et renommage
    for (i in 1:length(var_group$name)){
      data_group[,i] = data_group[,i]*var_group$sd[i] + var_group$mean[i]
      colnames(data_group)[i] = var_group$name[i]
      }
    
    # fusion avec le dataframe complet
    data <- bind_rows(data,data_group)
    }
  
  # ajout d'id individuels et stats demographiques
  n = length(data[,1])  # nombre total de participants
  data <- data %>% 
    mutate(Subject_nr = row_number() %>% as.character(),
           Sex = (c("H","F") %>% rep(times = n/2) %>% factor()),
           Age = seq(from = 16, to = 55, by = 1) %>% sample(size = n, 
                                                            replace = TRUE)
           ) %>% 
    relocate(Subject_nr)

  # mission accomplished!
  return(data)  
  }

# la fonction est donc clefs en main
data <- simulation(variables,fmodel,effect)

# standardisation
# Paradoxalement on va defaire ce qu'on a construit avec les moyennes,
# en re-standardisant tous les scores sous forme de z-scores
data_scale <- data %>% 
  select(OSIQ_O:SRI) %>% 
  mutate(across(everything(), ~ scale(.x)))

# k-means clustering
data_kmeans <- kmeans(data_scale, 
                      centers = 4,
                      nstart = 100)

# on ajoute les clusters aux donnees des participants
data <- data %>% mutate(Cluster = data_kmeans$cluster %>% factor())

# Profils cognitifs sous-jacents des clusters
# on fusionne les scores des composantes proches
deep <- data %>% 
  mutate(Spatial_Img = OSIQ_S + Corsi + MRT + SRI,
         Object_Img = OSIQ_O + VVIQ,
         Reasoning = Raven + Simili + Wason,
         Executive = Empan_MDT + WCST + Lecture) %>% 
  select(Spatial_Img : Executive, Cluster) %>% 
  mutate(across(c(Spatial_Img : Executive), 
                ~ rescale(.x, to = c(0,1))),)

# on cree un dataset d'analyse avec les variables continues standardisees
# (pour plus tard)
data_analysis <- data %>% 
  mutate(across(c(-Subject_nr,-Group,-Sex,-Age,-Cluster), 
                ~ scale(.x))
  )

# ---- correlation_matrix ------------------------------------------------------
# package "correlations" de easystats
data_scale %>% 
  correlation(partial = TRUE) %>% 
  cor_sort() %>% 
  summary() %>% 
  visualisation_recipe(
    labs = list(title = "Correlations entre les variables mesurees")) %>% 
  plot() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())

# ---- network_plot ------------------------------------------------------------
# graphe en reseau (corrr, igraph & ggraph)
data_scale %>%
  correlate() %>% 
  stretch %>% 
  filter(abs(r) >= .1) %>% 
  mutate(x = replace(x, x == "Empan_MDT", "Empan"),
         y = replace(y, y == "Empan_MDT", "Empan")) %>% 
  graph_from_data_frame(directed = FALSE) %>% 
  ggraph() +
    geom_edge_arc(strength = 0.1,
                  aes(edge_alpha = abs(r),
                      edge_width = abs(r),
                      colour = r)) +
    guides(edge_alpha = "none", edge_width = "none") +
    scale_edge_colour_gradientn(limits = c(-1, 1), 
                                colors = c("firebrick2", "dodgerblue2")) +
    geom_node_point(size = 20) +
    geom_node_text(aes(label = name,
                       family = "serif"),
                   colour = "white",
                   repel = FALSE) +
    theme_graph(base_family = "serif", base_size = 10) +
    #theme(legend.position = "none") +
    labs(title = "Correlations entre les variables mesurees")

# ---- mixed_matrix ------------------------------------------------------------
# matrice avec graphes et distributions
# GGally package
data_scale %>% 
  mutate(across(everything(), ~as.numeric(.x))) %>% 
  ggpairs(title = "Correlations et distributions des variables mesurees",
          lower = list(continuous = wrap("points", alpha = 0.2)),
          )

# ---- cluster_number ----------------------------------------------------------
data_scale %>% 
  fviz_nbclust(kmeans, method = "wss",
               linecolor = "white") +
  geom_vline(xintercept = 4, linetype = 2) +
  theme_bw(base_size = 14, base_family = "serif") +
  geom_line(aes(group = 1), color = "aquamarine2",size = 1.3) + 
  geom_point(group = 1, size = 3, color = "aquamarine4") +
  labs(title = "Nombre optimal de clusters (methode `Within Sum of Squares`)",
       x = "Nombre de clusters",
       y = "Total des Somme des Carres intra-clusters")

# ---- pca_variables -----------------------------------------------------------
data_scale %>% 
  prcomp(scale = TRUE) %>% 
  fviz_pca_var(repel = TRUE,
               col.var = "contrib",
               title = "Analyse en Composantes Principales des variables") + 
  theme_bw(base_size = 14, base_family = "serif") +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank()) +
  labs(x = "Dimension 1 (40.7%)",
       y = "Dimension 2 (18.4%)")

# ---- k-means -----------------------------------------------------------------
data_kmeans %>% 
  fviz_cluster(
    data_scale,
    geom = "point",
    repel = TRUE,
    ellipse.type = "convex",
    shape = "circle", pointsize = 1.2,
    main = 
      "Representation des clusters selon les deux composantes principales",
    xlab = "Dimension 1 (40.7%)",
    ylab = "Dimension 2 (18.4%)",
    ) +
  theme_bw(base_size = 14, base_family = "serif")

# ---- cluster_repatition ------------------------------------------------------
# repartion des groupes par cluster
data %>% 
  ggbivariate(outcome = "Group",
              explanatory = "Cluster") +
  scale_fill_manual("Groupe", 
                    values = c("aquamarine2", "coral"),
                    labels = c("Aphantasiques","Non-Aphantasiques")) +
  labs(title = 
    "Repartition des aphantasiques et non-aphantasiques dans les clusters")

# ---- profiles_radar ----------------------------------------------------------
deep %>%
  group_by(Cluster) %>%  
  summarise(across(everything(),mean)) %>% 
  ggradar(base.size = 10,
          font.radar = "serif",
          values.radar = c("0","0.5","1"),
          grid.label.size = 4,
          axis.labels = c( "Imagerie Spatiale",
                           "Imagerie\n Objet", 
                           "Raisonnement",
                           "Fonctions\n Executives"),
          grid.min = 0, grid.mid = .5, grid.max = 1,
          label.gridline.min = FALSE,
          group.line.width = 1, group.point.size = 3,
          group.colours =,
          background.circle.transparency = .1,
          legend.title = "Clusters",
          legend.text.size = 12,
          legend.position = "bottom",
          plot.title = "Profils cognitifs des clusters identifies 
par partition non-supervisee (k-means)",
          fill = TRUE,
          fill.alpha = 0.1
  ) + 
  theme_bw(base_size = 14, base_family = "serif") +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank()) +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())
  #facet(facet.by = "Cluster")

# ---- profiles_lollipop -------------------------------------------------------
deep %>% 
  gather(key = variable, value = value, -Cluster) %>% 
  mutate(variable = replace(variable, variable == "Spatial_Img", "Imagerie\n Spatiale"),
         variable = replace(variable, variable == "Reasoning", "Raisonnement"),
         variable = replace(variable, variable == "Object_Img", "Imagerie\n Objet"),
         variable = replace(variable, variable == "Executive", "Fonctions\n Exectutives")) %>% 
  group_by(variable, Cluster) %>% 
  summarise(mean = mean(value)) %>% 
  ggdotchart(
    x = "variable",
    y = "mean",
    group = "Cluster",
    color = "Cluster", size = 1, dot.size = 3,
    palette = "aas",
    add = "segment",
    position = position_dodge(0),
    #sorting = "descending",
    #facet.by = "Cluster",
    #rotate = TRUE,
    #legend = "none",
    ggtheme = theme_bw(base_size = 14, base_family = "serif"),
    xlab = "Fonctions Cognitives",
    ylab = "Moyennes",
    title =
      "Scores aux differentes fonctions cognitives en fonction des clusters"
    ) +
  geom_smooth(aes(group = Cluster, color = Cluster),size = .8) +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        )

# ---- object_img_violins ------------------------------------------------------
# Comparaisons de moyennes entre clusters par variable

# Object mean comparison
data %>% 
  ggplot(aes(x = Cluster,reorder(1, 2, 3, 4),
             y = OSIQ_O,
             fill = Cluster,)) +
  geom_violin(alpha = 0.3,
              position = position_dodge(1),
              draw_quantiles = FALSE,) +
  geom_boxplot(alpha = 0.6,
               position = position_dodge(1),
               width = 0.15,) +
  # significance indicator labels
  stat_compare_means(comparisons = list(c("1","2"),
                                        c("3","4"), 
                                        c("1","4")
  ),
  method = "t.test",
  label = "p.format",
  # height of the labels
  label.y.npc = c("top")) +
  # different filler colors
  scale_fill_brewer(palette = "Dark2") +
  scale_colour_brewer(palette = "Dark2") +
  labs(title = "Distribution des scores d'imagerie visuelle-objet par cluster",
       x = "Cluster",
       y = "Score à l'OSIQ Object Scale")

#---- spatial_img_violins ------------------------------------------------------
# Spatial mean comparison
data %>% 
  ggplot(aes(x = Cluster,reorder(1, 2, 3, 4),
             y = OSIQ_S,
             fill = Cluster,)) +
  geom_violin(alpha = 0.3,
              position = position_dodge(1),
              draw_quantiles = FALSE,) +
  geom_boxplot(alpha = 0.6,
               position = position_dodge(1),
               width = 0.15,) +
  # significance indicator labels
  stat_compare_means(comparisons = list(c("1","2"),
                                        c("2","3"), 
                                        c("3","4"),
                                        c("1","4")
  ),
  method = "t.test",
  label = "p.format",
  # height of the labels
  label.y.npc = c("top")) +
  # different filler colors
  scale_fill_brewer(palette = "Dark2") +
  scale_colour_brewer(palette = "Dark2") +
  labs(title = "Distribution des scores d'imagerie visuospatiale par cluster",
       x = "Cluster",
       y = "Score à l'OSIQ Spatial Scale")
```
