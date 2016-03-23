
RED		= '\033[0;31m'
GREEN		= '\033[0;32m'
CYAN		= '\033[0;36m'
LIGHT_PURPLE	= '\033[1;35m'
LIGHT_BLUE	= '\033[1;34m'
LIGHT_GRAY	= '\033[0;37m'
NC		= '\033[0m'

NAME		= step1

ML		= wall.ml \
		  cell.ml \
		  labyrinth.ml \
		  main.ml

MLI		= wall.mli \
		  cell.mli \
		  labyrinth.mli

RM		= rm -f

CMI		= $(MLI:.mli=.cmi)
CMO		= $(ML:.ml=.cmo)
CMX		= $(ML:.ml=.cmx)

OCAMLDEP	= ocamlfind ocamldep -modules
OCAMLC		= ocamlfind ocamlc
OCAMLOPT	= ocamlfind ocamlopt

all:		.depend $(CMI) $(NAME)

byte:		.depend $(CMI) $(NAME).byte

$(NAME):	$(CMX)
		@$(OCAMLOPT) -linkpkg $(CMX) -o $@
		@printf " ${LIGHT_PURPLE} -- [OK] $(NAME) linked -- ${NC} \n"

$(NAME).byte:	$(CMO)
		@$(OCAMLC) -linkpkg $(CMO) -o $@
		@printf " ${LIGHT_PURPLE} -- [OK] $(NAME).byte linked -- ${NC} \n"

%.cmx:		%.ml
		@$(OCAMLOPT) -c $< -o $@
		@printf " ${GREEN} -- [OK] $< built -- ${NC} \n"

%.cmo:		%.ml
		@$(OCAMLC) -c $< -o $@
		@printf " ${GREEN} -- [OK] $< built -- ${NC} \n"

%.cmi:		%.mli
		@$(OCAMLC) -c $< -o $@
		@printf " ${LIGHT_BLUE} -- [OK] $< built -- ${NC} \n"

clean:
		@$(RM) *.cm* *.o .depend *~
		@printf " ${LIGHT_GRAY} -- [OK] cleaned up a bit -- ${NC} \n"

fclean:		clean
		@$(RM) $(NAME) $(NAME).byte
		@printf " ${LIGHT_GRAY} -- [OK] cleaned everything -- ${NC} \n"

re:		fclean all

.depend:
		@$(RM) .depend
		@$(OCAMLDEP) $(MLI) $(ML) > .depend
		@printf " ${CYAN} -- [OK] dependencies -- ${NC} \n"
