from rich.align import Align
from rich.box import ROUNDED
from rich.console import Console
from rich.table import Table
from rich.prompt import Prompt
from rich.panel import Panel

console = Console(width=180, force_terminal=True)

from datetime import datetime
import os

ARQUIVO_ORIGEM = "a1.txt"
ARQUIVO_DESTINO = "a2.txt"
PASTA_REG = "No"

# =========================================================
# LIMPAR TELA
# =========================================================

def limpar_tela():
    os.system("cls" if os.name == "nt" else "clear")


# =========================================================
# INICIALIZAR ARQUIVOS
# =========================================================

def inicializar_arquivos():
    """Garante que os arquivos e pastas essenciais existam."""
    for arquivo in (ARQUIVO_ORIGEM, ARQUIVO_DESTINO):
        if not os.path.exists(arquivo):
            open(
                arquivo,
                "w",
                encoding="utf-8"
            ).close()

    if not os.path.exists(PASTA_REG):
        os.makedirs(PASTA_REG)
        caminho_log = os.path.join(
            PASTA_REG,
            "data.log"
        )
        with open(
            caminho_log,
            "w",
            encoding="utf-8"
        ) as f:
            f.write(
                datetime.now().strftime(
                    "%d/%m/%Y"
                )
            )
    else:
        verificar_dias()


# =========================================================
# VERIFICAR DIAS
# =========================================================

def verificar_dias():
    """Calcula a diferença de dias desde a criação da pasta."""
    caminho_log = os.path.join(
        PASTA_REG,
        "data.log"
    )
    if os.path.exists(caminho_log):
        try:
            with open(
                caminho_log,
                "r",
                encoding="utf-8"
            ) as f:
                data_inicial = datetime.strptime(
                    f.read().strip(),
                    "%d/%m/%Y"
                )
            dias = (
                datetime.now() - data_inicial
            ).days
            caminho_dias = os.path.join(
                PASTA_REG,
                "data1.log"
            )
            with open(
                caminho_dias,
                "w",
                encoding="utf-8"
            ) as f:
                f.write(
                    f"A diferença de dias é: {dias}"
                )
        except ValueError:
            pass

# =========================================================
# CARREGAR LINHAS
# =========================================================

def carregar_linhas(nome_arquivo):
    """Carrega linhas não vazias de um arquivo."""
    if not os.path.exists(nome_arquivo):
        return []
    with open(
        nome_arquivo,
        "r",
        encoding="utf-8"
    ) as f:
        return [
            linha.strip()
            for linha in f
            if linha.strip()
        ]

# =========================================================
# CARREGAR A1 NUMERADO
# =========================================================

def carregar_origem_numerada():
    """
    Lê o a1.txt sem modificar o arquivo.

    Retorna:

        [(numero_da_linha, texto), ...]

    Exemplo:

        [(1, "JOAO"), (3, "JOAO")]
    """

    if not os.path.exists(ARQUIVO_ORIGEM):
        return []

    linhas = []

    with open(
        ARQUIVO_ORIGEM,
        "r",
        encoding="utf-8"
    ) as f:

        for numero, linha in enumerate(
            f,
            start=1
        ):

            linha = linha.strip()

            if linha:

                linhas.append(
                    (numero, linha)
                )

    return linhas


# =========================================================
# SALVAR LINHAS
# =========================================================

def salvar_linhas(
    nome_arquivo,
    linhas
):
    """Salva uma lista de linhas em um arquivo."""

    with open(
        nome_arquivo,
        "w",
        encoding="utf-8"
    ) as f:

        for linha in linhas:

            f.write(
                linha + "\n"
            )


# =========================================================
# EXTRAIR NÚMERO
# =========================================================
def extrair_numero(linha):
    """
    Extrai o número entre [ ].
    Exemplo:
        [25] JOAO
    retorna:
        25
    """
    try:
        if linha.startswith("["):
            fim = linha.index("]")
            return int(
                linha[1:fim]
            )
    except (
        ValueError,
        IndexError
    ):
        pass
    return 999999


# =========================================================
# OBTER DESTINO ORDENADO
# =========================================================

def obter_destino_ordenado():
    """Carrega o a2.txt e ordena pela linha original."""
    linhas = carregar_linhas(
        ARQUIVO_DESTINO
    )
    return sorted(
        linhas,
        key=extrair_numero
    )

def extrair_texto_registro(item):
    """Remove a numeração do formato [N] texto e retorna apenas o texto."""
    texto = item
    if item.startswith("["):
        try:
            fim = item.index("]")
            texto = item[fim + 1:].strip()
        except ValueError:
            pass
    return texto


def criar_tabela_padrao(titulo):
    """Gera o estilo visual padronizado das tabelas do sistema."""
    return Table(
        title=titulo,
        title_style="bold cyan",
        header_style="bold white",
        box=ROUNDED,
        show_lines=True,
        expand=True,
        padding=(0, 1),
        pad_edge=False,
    )


# =========================================================
# TABELA DO A1
# =========================================================

def criar_tabela_a1(
    linhas,
    escolhido=None
):
    """
    Cria a tabela do A1.

    escolhido:
        número da escolha que acabou de ser adicionada.

    O ✓ é somente visual.
    Não é salvo em nenhum arquivo.
    """

    table = criar_tabela_padrao(
        "RESULTADO ENCONTRADO - A1.TXT"
    )

    table.add_column(
        "Status",
        style="bold green",
        justify="center",
        width=8,
    )

    table.add_column(
        "Linha",
        style="bold yellow",
        justify="center",
        width=12,
        min_width=12,
        no_wrap=True,
    )

    table.add_column(
        "Registro",
        style="bold white",
        overflow="fold",
        no_wrap=False,
    )

    for indice, (numero, texto) in enumerate(
        linhas,
        start=1
    ):

        if escolhido == indice:

            table.add_row(
                "[green]✓[/green]",
                f"[green]{numero}[/green]",
                f"[green]{texto}[/green]"
            )

        else:

            table.add_row(
                "",
                str(numero),
                texto
            )

    return table


# =========================================================
# TABELA DO A2
# =========================================================

def criar_tabela_a2(item_recente=None):
    """
    Cria a tabela com o conteúdo atual do A2.

    Mantém a ordenação pelo número original.
    """

    linhas = obter_destino_ordenado()

    table = criar_tabela_padrao(
        "A2.TXT - LISTA ATUALIZADA"
    )

    table.add_column(
        "Linha",
        style="bold yellow",
        justify="center",
        width=8,
    )

    table.add_column(
        "Registro",
        style="bold white",
        overflow="ellipsis",
        no_wrap=True,
    )

    for item in linhas:

        numero = extrair_numero(item)
        texto = extrair_texto_registro(item)

        if item_recente is not None and item == item_recente:
            table.add_row(
                f"[bold green]{str(numero)}[/bold green]",
                f"[bold green]{texto}[/bold green]",
            )
        else:
            table.add_row(
                str(numero),
                texto,
            )

    return table


# =========================================================
# EXIBIR A2
# =========================================================

def exibir_tabela_a2():
    """Mostra a tabela atualizada do A2."""

    limpar_tela()

    console.print(
        criar_tabela_a2()
    )

    input(
        "\nPressione ENTER para voltar..."
    )


# =========================================================
# ADICIONAR ITEM
# =========================================================

def adicionar_itens_por_termo(termo):

    origem = carregar_origem_numerada()

    destino = carregar_linhas(
        ARQUIVO_DESTINO
    )

    # -----------------------------------------------------
    # PROCURA NO A1
    # -----------------------------------------------------

    correspondencias = [
        (numero, texto)
        for numero, texto in origem
        if termo.lower() in texto.lower()
    ]

    if not correspondencias:
        return 0, []


    # -----------------------------------------------------
    # REMOVE OS QUE JÁ ESTÃO NO A2
    # -----------------------------------------------------

    disponiveis = []

    for numero, texto in correspondencias:

        item = f"[{numero}] {texto}"

        if item not in destino:

            disponiveis.append(
                (numero, texto)
            )


    if not disponiveis:
        return 0, correspondencias


    # =====================================================
    # APENAS 1 RESULTADO
    # ADICIONA DIRETO
    # =====================================================

    if len(disponiveis) == 1:

        numero, texto = disponiveis[0]

        item = f"[{numero}] {texto}"

        destino.append(item)

        destino.sort(
            key=extrair_numero
        )

        salvar_linhas(
            ARQUIVO_DESTINO,
            destino
        )

        # ---------------------------------------------
        # MOSTRA TABELA A1 COM ✓
        # ---------------------------------------------

        limpar_tela()

        console.print(
            criar_tabela_a1(
                disponiveis,
                escolhido=1
            )
        )

        console.print()

        # ---------------------------------------------
        # MOSTRA TABELA A2
        # ---------------------------------------------

        console.print(
            criar_tabela_a2(item_recente=item)
        )

        input(
            "\nPressione ENTER para continuar..."
        )

        return 1, [item]


    # =====================================================
    # VÁRIOS RESULTADOS
    # AQUI SIM PERGUNTA
    # =====================================================

    limpar_tela()

    console.print(
        criar_tabela_a1(
            disponiveis
        )
    )

    console.print(
        "\n[red][0][/red] Cancelar"
    )


    # -----------------------------------------------------
    # ESCOLHA
    # -----------------------------------------------------

    while True:

        escolha = Prompt.ask(
            "Qual deseja adicionar",
            default="0"
        )

        if escolha == "0":

            return 0, correspondencias


        try:

            escolha = int(
                escolha
            )

        except ValueError:

            console.print(
                "[red]Digite apenas um número.[/red]"
            )

            continue


        if (
            escolha < 1
            or escolha > len(disponiveis)
        ):

            console.print(
                "[red]Opção inválida.[/red]"
            )

            continue


        # -------------------------------------------------
        # PEGA O ESCOLHIDO
        # -------------------------------------------------

        numero, texto = (
            disponiveis[
                escolha - 1
            ]
        )

        item = (
            f"[{numero}] {texto}"
        )


        # -------------------------------------------------
        # ADICIONA AO A2
        # -------------------------------------------------

        destino.append(
            item
        )

        destino.sort(
            key=extrair_numero
        )

        salvar_linhas(
            ARQUIVO_DESTINO,
            destino
        )


        # =================================================
        # MOSTRA AS DUAS TABELAS
        # =================================================

        limpar_tela()


        # -------------------------------------------------
        # TABELA A1
        # ✓ SOMENTE NO ESCOLHIDO
        # -------------------------------------------------

        console.print(
            criar_tabela_a1(
                disponiveis,
                escolhido=escolha
            )
        )

        console.print()


        # -------------------------------------------------
        # TABELA A2
        # -------------------------------------------------

        console.print(
            criar_tabela_a2(item_recente=item)
        )


        # -------------------------------------------------
        # ESPERA
        # -------------------------------------------------

        input(
            "\nPressione ENTER para continuar..."
        )

        return 1, [item]



# =========================================================
# MENU
# =========================================================

def menu():
    inicializar_arquivos()

    while True:
        limpar_tela()

        menu_itens = [
            ("[A]", "Abrir lista completa do destino"),
            ("[B]", "Buscar no arquivo principal"),
            ("[AD]", "Adicionar número/termo"),
            ("[BL]", "Buscar na lista de destino"),
            ("[L]", "Listar numerada e ordenada"),
            ("[P]", "Exportar para No/N.txt"),
            ("[S]", "Sair"),
        ]

        menu_texto = "\n".join(
            f"[bold cyan]{codigo}[/bold cyan]   [bold]{descricao}[/bold]"
            if codigo != "[S]"
            else f"[bold red]{codigo}[/bold red]   [bold]{descricao}[/bold]"
            for codigo, descricao in menu_itens
        )

        menu_panel = Panel(
            Align.center(menu_texto),
            title="[bold cyan]SISTEMA DE BUSCA E ORDENAÇÃO[/bold cyan]",
            title_align="center",
            border_style="cyan",
            padding=(1, 3),
            expand=False,
            box=ROUNDED,
        )

        console.print(menu_panel)

        opcao = input(
            "\nEscolha uma opção: "
        ).strip()

        opcao_up = opcao.upper()


        # =================================================
        # SAIR
        # =================================================

        if opcao_up == "S":

            break


        # =================================================
        # ABRIR A2
        # =================================================

        elif opcao_up == "A":

            exibir_tabela_a2()


        # =================================================
        # BUSCAR
        # =================================================

        elif opcao_up in (
            "B",
            "BL"
        ):

            if opcao_up == "B":

                termo = input(
                    "Digite o termo para buscar em a1.txt: "
                ).strip()

                if termo:

                    encontrados = [
                        linha
                        for linha in carregar_origem_numerada()
                        if termo.lower()
                        in linha[1].lower()
                    ]

                    if encontrados:

                        limpar_tela()

                        table = criar_tabela_padrao(
                            "RESULTADOS EM A1.TXT"
                        )

                        table.add_column(
                            "Linha",
                            style="bold yellow",
                            justify="center",
                            width=12,
                            min_width=12,
                            no_wrap=True,
                        )

                        table.add_column(
                            "Registro",
                            style="bold white",
                            overflow="fold",
                            no_wrap=False,
                        )

                        for numero, texto in encontrados:

                            table.add_row(
                                str(numero),
                                texto
                            )

                        console.print(
                            table
                        )

                    else:

                        limpar_tela()

                        console.print(
                            "[yellow]Nenhum registro encontrado.[/yellow]"
                        )

                    input(
                        "\nPressione ENTER para voltar..."
                    )


            else:

                termo = input(
                    "Digite o termo para buscar em a2.txt: "
                ).strip()

                if termo:

                    encontrados = [
                        linha
                        for linha in carregar_linhas(
                            ARQUIVO_DESTINO
                        )
                        if termo.lower()
                        in linha.lower()
                    ]

                    limpar_tela()

                    table = criar_tabela_padrao(
                        "RESULTADOS EM A2.TXT"
                    )

                    table.add_column(
                        "Linha",
                        style="bold yellow",
                        justify="center",
                        width=12,
                        min_width=12,
                        no_wrap=True,
                    )

                    table.add_column(
                        "Registro",
                        style="bold white",
                        overflow="fold",
                        no_wrap=False,
                    )

                    for item in encontrados:

                        numero = extrair_numero(item)
                        texto = extrair_texto_registro(item)

                        table.add_row(
                            str(numero),
                            texto,
                        )

                    console.print(
                        table
                    )

                    input(
                        "\nPressione ENTER para voltar..."
                    )


        # =================================================
        # LISTAR A2
        # =================================================

        elif opcao_up == "L":

            exibir_tabela_a2()


        # =================================================
        # EXPORTAR
        # =================================================

        elif opcao_up == "P":

            linhas_ordenadas = (
                obter_destino_ordenado()
            )

            caminho_n = os.path.join(
                PASTA_REG,
                "N.txt"
            )

            salvar_linhas(
                caminho_n,
                linhas_ordenadas
            )

            try:

                os.startfile(
                    caminho_n
                )

                print(
                    "Arquivo gerado e aberto!"
                )

            except AttributeError:

                print(
                    f"Arquivo gerado em: "
                    f"{caminho_n}"
                )

            input(
                "\nPressione ENTER para voltar..."
            )


        # =================================================
        # ADICIONAR
        # =================================================

        elif opcao_up == "AD":

            termo = input(
                "Digite o número ou nome para adicionar: "
            ).strip()

            if termo:

                resultado = (
                    adicionar_itens_por_termo(
                        termo
                    )
                )

                if resultado != 0:

                    pass

                else:

                    limpar_tela()

                    console.print(
                        "[yellow]Não encontrado no a1.txt "
                        "ou já adicionado.[/yellow]"
                    )

                    input(
                        "\nPressione ENTER para voltar..."
                    )


        # =================================================
        # DIGITA DIRETAMENTE
        # =================================================

        else:

            if opcao:

                resultado = (
                    adicionar_itens_por_termo(
                        opcao
                    )
                )

                if resultado == 0:

                    limpar_tela()

                    console.print(
                        "[yellow]Termo não encontrado "
                        "em a1.txt ou já adicionado.[/yellow]"
                    )

                    input(
                        "\nPressione ENTER para continuar..."
                    )


# =========================================================
# INÍCIO
# =========================================================

if __name__ == "__main__":

    menu()
