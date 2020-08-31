class ValidarUnidade < SitePrism::Page
    
    include RSpec::Matchers
    
    set_url ''
    
    element :unidades, 'a[href="/unidades"]'
    element :filtrofacilidade, '#checkoox-select-facilities > div'
    element :bicicletário, '#gatsby-focus-wrapper > div.sc-bdVaJa.gridcomponent__GridStyled-sc-8zg10d-0.fHFDYJ > div.sc-bwzfXH.gridcomponent__RowStyled-sc-8zg10d-1.fqDNCQ > div:nth-child(3) > div.checkbox-selectcomponentstyle__CheckboxSelectWrapperStyled-sc-7ktrvg-0.ijWekg > div.animationcomponentstyle__ForcedFade-sc-7lsrx1-1.ebkWHA > div > div:nth-child(3) > label > div > div > div.boxcomponentstyle__Item-sc-43ermp-1.kVNSgu > label'
    element :vacinacao, '#gatsby-focus-wrapper > div.sc-bdVaJa.gridcomponent__GridStyled-sc-8zg10d-0.fHFDYJ > div.sc-bwzfXH.gridcomponent__RowStyled-sc-8zg10d-1.fqDNCQ > div:nth-child(3) > div.checkbox-selectcomponentstyle__CheckboxSelectWrapperStyled-sc-7ktrvg-0.ijWekg > div.animationcomponentstyle__ForcedFade-sc-7lsrx1-1.ebkWHA > div > div:nth-child(4) > label > div > div > div.boxcomponentstyle__Item-sc-43ermp-1.kVNSgu > label'
    element :aosdomingos, '#gatsby-focus-wrapper > div.sc-bdVaJa.gridcomponent__GridStyled-sc-8zg10d-0.fHFDYJ > div.sc-bwzfXH.gridcomponent__RowStyled-sc-8zg10d-1.fqDNCQ > div:nth-child(3) > div.checkbox-selectcomponentstyle__CheckboxSelectWrapperStyled-sc-7ktrvg-0.ijWekg > div.animationcomponentstyle__ForcedFade-sc-7lsrx1-1.ebkWHA > div > div:nth-child(5) > label > div > div > div.boxcomponentstyle__Item-sc-43ermp-1.kVNSgu > label'
    element :unidadelibano, 'h3[class="typographycomponentstyle__H3-sc-1oox73n-3 caOpMn"]'
    element :unidadeanalia,'#anchor-unit-cell-analia-franco-ii > div:nth-child(1) > div > div > div.boxcomponentstyle__Item-sc-43ermp-1.kVNSgu > h3' 
    element :unidadejau, '#anchor-unit-cell-jau > div:nth-child(1) > div > div > div.boxcomponentstyle__Item-sc-43ermp-1.kVNSgu > h3' 
    element :detalheslibano, '#button-see-on-map-2-republica-do-libano-i > div'
    element :detalhesanalia,  '#button-see-on-map-2-analia-franco-ii > div'
    element :detalhesjau,  '#button-see-on-map-2-jau > div'    
    element :nomeunidade, '#gatsby-focus-wrapper > div.sc-bdVaJa.gridcomponent__GridStyled-sc-8zg10d-0.fHFDYJ > div.sc-bwzfXH.gridcomponent__RowStyled-sc-8zg10d-1.efEBCe > div > h1'

    def validar(opcoes)
        unidades.click
        sleep(2)
        filtrofacilidade.click

        case opcoes
        when 3
            bicicletário.click
            vacinacao.click        
            aosdomingos.click
            sleep(1)
            @unidadepesquisada = unidadelibano.text
            detalheslibano.click
        when 2
            bicicletário.click
            vacinacao.click        
            sleep(1)
            @unidadepesquisada = unidadeanalia.text
            detalhesanalia.click
        when 1
            bicicletário.click
            sleep(1)
            @unidadepesquisada = unidadejau.text
            detalhesjau.click
        end
            @nomeunidadepesquisada = nomeunidade.text
            expect(@unidadepesquisada).to eq @nomeunidadepesquisada
    end
end







