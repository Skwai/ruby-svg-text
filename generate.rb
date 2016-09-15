require "RMagick"

svg = '<svg width="267px" height="51px" viewBox="-2 -1 267 51" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
    <defs>
        <filter x="-50%" y="-50%" width="200%" height="200%" filterUnits="objectBoundingBox" id="filter-2">
            <feOffset dx="0" dy="1" in="SourceAlpha" result="shadowOffsetOuter1"></feOffset>
            <feGaussianBlur stdDeviation="1" in="shadowOffsetOuter1" result="shadowBlurOuter1"></feGaussianBlur>
            <feColorMatrix values="0 0 0 0 0   0 0 0 0 0   0 0 0 0 0  0 0 0 0.5 0" type="matrix" in="shadowBlurOuter1"></feColorMatrix>
        </filter>
    </defs>
    <g id="This-is-a-test" stroke="none" fill="none" fill-opacity="1">
        <use fill="#000000" filter="url(#filter-2)" xlink:href="#text-1"></use>
        <text id="text-1" font-family="Ubuntu" font-size="40" font-weight="400" letter-spacing="3.125" fill="#000000">
            <tspan x="0.305" y="37">民得经十三</tspan>
        </text>
    </g>
</svg>'

img = Magick::Image.from_blob(svg) {
  self.format = 'SVG'
  self.background_color = 'transparent'
}

img[0].write('example.png')
exit
