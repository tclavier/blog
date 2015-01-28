Title:Chiffrement
Date:2012-05-03
Tags: Documentation TcWeb,  mediawiki

Chiffrage, cryptographie, signature numérique, protection des données,
autants de termes pour désigner un processus mathématique appliqué à la
vie courante. Dans la pratique, il n'existe que 2 grandes techniques
pour chiffrer un messages : le chiffrage symétrique et le chiffrage
assymétrique. Mais avant d'aborder ces 2 notions commençont par quelques
définitions. Et nous finirons par les aspects de confiances.

Juste une petite remarque avant de commencer, cet article n'est qu'un
survole du sujet, et j'y fais quelques aproximations.

Définitions
-----------

En simplifiant un peut, on peut réduire l'objectif de la cryptographie à
l'échange d'un message entre 2 personnes sans que le reste du monde ne
puisse le lire. Nous allons donc parler de **message** et de **clé** de
chiffrage.

-   Le **message** c'est l'information secrète à faire circuler.
-   La **clé** c'est l'élément qui permet de protéger le message

Méthodes de chiffrage
---------------------

### Clé unique

[right](image:Clé_unique.png "wikilink") C'est la méthode la plus
ancienne, mais aussi la plus simple. Le message est codé avec la clé, et
il n'est possible de le décoder qu'avec cette clé. C'est un peut comme
si on enfermait le message dans un coffre, la clé permet de fermer et
d'ouvir le coffre. Toute la difficulté avec cette technique c'est de
transporter la clé de façon sécurisé. En effet, si votre coursier qui
transporte le coffre, transporte aussi la clé sur lui, n'importe quel
voleur qui attaque votre coursier pourra ouvrir le coffre. Votre message
devient donc très vite non sécurisé, et ce, même si vous avez la plus
solide des serrures avec le plus solide des coffres. De plus, si vous
souhaitez échanger un message avec Paul et un autre avec Mathieu, il
vous faut 2 coffres, avec 2 clés. Les difficultés de cette méthodes sont
donc les suivantes :

-   sécuriser les échanges de clés
-   gérer les nombreuses clés

### Chiffrage assymétrique

Avec cette technique, chacun a 2 clés, une privé et une publique, et un
message chiffré avec l'une des clé ne peut être déchiffré qu'avec la
seconde clé. La clé privé est jalousement gardé par son propriétaire,
alors que la clé publique est comme sont nom l'indique divulgué à tout
le monde.

Si l'on reprend l'analogie avec le coffre, c'est comme si notre coffre
était équipé de 2 anneaux pour y passer un cadena. L'une des clé va être
un cadena ouvert, donc ça ne permet que de fermer le coffre. Et l'autre
clé, le moyen d'ouvrir le cadena, donc ça ne permet que d'ouvrir le
coffre. La seul différence avec cette image c'est que les 2 clés peuvent
indifféremment servir de cadena ou de clé.

Les avantages de cette technique sont multiples. Imaginons que
Clémentine chiffre un message avec la clé publique de Paul, seul Paul
avec sa clé privé peut le déchiffrer. Donc Clémentine peut envoyer un
message totalement sécurisé à Paul.

Maintenant, si Mathieu envoi à Clémentine un message chiffré avec sa clé
privé, Clémentine pourra le déchiffré uniquement avec la clé publique de
Mathieu, ainsi elle sera sur que c'est bien Mathieu qui l'a envoyé.
C'est ce que l'on appel une signature numérique.

Avec cette technique, plus besoins de sécurisé l'échange de clé, en
revanche, il devient difficile de savoir si la clé public de Mathieu est
bien la bonne et pas celle d'un escroc.

Une histoire de confiance
-------------------------

Avec la méthode de chiffrage par clés assymétrique, chacun a donc une
paire de clés, mais comment être sur que la clé de Mathieu n'est pas
celle d'un imposteur, il est en effet très facile de créer une paire de
clé et de dire cette clé publique c'est celle de Paul ou de Mathieu. Il
existe deux solution pour garantir l'identité du porteur de la clé, le
tiers de confiance ou le réseau de confiance.

### Le tiers de confiance

Imaginons que l'état ait une paire de clé. Si Mathieu va dans sa mairie
avec sa clé publique et ses papiers, il peut demander à l'état de lui
signé sa clé. C'est à dire que l'état représenté ici par la secrétaire
de mairie va d'abord vérifié son identité puis va ensuite chiffré sa clé
publique avec la clé privé de l'état. Une fois cette opération réalisé,
Mathieu va pouvoir diffusé sa clé signé par l'état. Quand Clémentine va
recevoir un message signé par mathieu, elle pourra vérifié que cette
signature a bien été faite avec la clé privé de Mathieu et elle sera sur
que c'est bien celle de Mathieu parceque l'état (en qui elle a
confiance) lui confirme. Dans la pratique, l'état français n'a pas de
clés, par contre, il existe un certains nombre de sociétés qui signent
contre rétribution, les clés des clients après avoir vérifié leur
identité, on appel celà un certificat délivré par un tiers de confiance.

### Le réseau de confiance

Mais comment faire confiance à une seule entité comment être sur que la
société Vérisign par exemple n'a pas signé une clé sans vérifier
l'identité simplement parcequ'un client à payé plus ?

Si l'on reprend nos héros, Clémentine a plus confiance en Paul qu'en
Verisign, parceque Paul elle le connait bien. Or Paul connais bien
Mathieu, donc un jour Paul à signé la clé de Mathieu, après avoir
vérifié son identité biensur. Maintenant quand Clémentine reçoit un
message de Mathieu, elle est sur que c'est bien lui, c'est Paul qui lui
dit.

Vous allez me dire qu'il n'y a pas beaucoup de différence avec le tiers
de confiance. Jusque là c'est vraie, sauf que Paul ne connait pas tout
le monde et que pour d'autres personnes, il peut y avoir plusieurs
intermédiaires, par exemple Paul signe la clé de Mathieu, Clémentine
signe la clé de Paul et Céline signe la clé de Clémentine donc moi, si
je fais confiance à Céline qui fait confiance à Clémentine qui fait
confiance à Paul, alors je peux dire que la clé de Mathieu est la bonne.
Imaginons maintenant que l'on donne un pourcentage de confiance à
chacun, il est alors facile de calculer un degré de confiance entre 2
personnes plus ou moins éloigné dans le réseau.

C'est ça un réseau de confiance, c'est la solution la plus sur, mais
aussi la plus économique. En revanche celà demande plus de travaille, il
faut prendre l'habitude de de signer les clés des gens que l'on
rencontre. C'est cette technique qui est utilisé avec
[GnuPG](gnupg.hml "wikilink"). Le gros inconvénient, c'est que pour savoir
si une clé est la bonne, il faut que les 2 interlocuteurs facent parti
du même réseau de confiance.

### CAcert.org

Une solution intermédiaire entre le réseau de confiance et le tiers de
confiance. En effet, CAcert.org est un réseau de confiance qui va servir
de tiers de confiance. Je m'explique, tout le monde peut demander
gratuitement une signature de clé par CAcert.org, Si c'est automatisable
(identification d'un email par exemple) celà sera réalisé par un robot,
si ça ne l'ai pas, il faut aller voir physiquement l'une des personnes
du réseau de confiance CAcert.org. Il est donc possible d'avoir
gratuitement un certificat pour signer et chiffrer des messages sans
forcément faire parti d'un réseau de confiance. Pour [Utiliser
CAcert.org](utiliser-cacert-org.hml "wikilink") je vous invite à lire
l'article dédié.

