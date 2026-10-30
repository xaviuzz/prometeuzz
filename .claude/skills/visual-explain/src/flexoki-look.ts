const FLEXOKI_LIGHT: Record<string, string> = {
  '--pele-bg': '#FFFCF0',
  '--pele-fg': '#100F0F',
  '--pele-muted': '#6F6E69',
  '--pele-line': '#100F0F',
  '--pele-surface': '#F2F0E5',
  '--pele-surface-alt': '#E6E4D9',
  '--pele-border': '#CECDC3',
  '--pele-accent': '#BC5215',
  '--pele-series-1': '#BC5215',
  '--pele-series-2': '#205EA6',
  '--pele-series-3': '#66800B',
  '--pele-series-4': '#AD8301',
  '--pele-series-5': '#5E409D',
  '--pele-series-6': '#24837B',
  '--pele-series-7': '#AF3029',
  '--pele-series-8': '#A02F6F',
}

export class FlexokiLook {
  dress(svg: string): string {
    const declarations = this.declarations()
    const dressed = svg.replace('style="', `style="${declarations};`)

    return dressed
  }

  private declarations(): string {
    const pairs: string[] = []
    for (const [name, value] of Object.entries(FLEXOKI_LIGHT)) {
      pairs.push(`${name}:${value}`)
    }

    return pairs.join(';')
  }
}
