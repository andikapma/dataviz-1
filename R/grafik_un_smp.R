grafik_un_smp <- function(.data, matpel, tahun_awal, tahun_akhir, judul = "Perubahan Rerata Nilai Ujian Nasional", subjudul = "Nilai Ujian Nasional Tingkat SMP Kota Bandung") {
  matpel <-
    matpel %>%
    str_replace_all(pattern = "[:punct:]|[:space:]", replacement = "_") %>%
    str_to_lower()
  
  .data %>%
    select(nama_kecamatan, tahun, contains(matpel)) %>%
    filter(tahun %in% c(tahun_awal, tahun_akhir)) %>%
    spread(key = "tahun", value = str_c("nilai_rerata_", matpel)) %>%
    rename("awal" = 2, "akhir" = 3) %>%
    mutate(
      rerata = (awal + akhir) / 2,
      status = if_else(akhir - awal > 0, "Meningkat", "Menurun"),
      status = factor(status, levels = c("Meningkat", "Menurun"))
    ) %>%
    ggplot() +
    geom_segment(
      aes(
        x = awal,
        xend = akhir,
        y = fct_reorder(nama_kecamatan, rerata),
        yend = fct_reorder(nama_kecamatan, rerata),
        colour = status
      ),
      arrow = arrow(length = unit(2, "mm")),
      lwd = 1
    ) +
    geom_point(
      aes(
        x = rerata,
        y = fct_reorder(nama_kecamatan, rerata)
      ),
      colour = "#268AFF",
      size = 2
    ) +
    geom_text(
      aes(
        x = awal,
        y = nama_kecamatan,
        label = round(awal, 1),
        hjust = if_else(status == "Meningkat", 1.2, -0.2)
      ),
      family = "Lato",
      color = "gray25",
      size = 2.5
    ) +
    geom_text(
      aes(
        x = akhir,
        y = nama_kecamatan,
        label = round(akhir, 1),
        hjust = if_else(status == "Meningkat", -0.2, 1.2)
      ),
      family = "Lato",
      color = "gray25",
      size = 2.5
    ) +
    geom_text(
      aes(
        x = rerata,
        y = nama_kecamatan,
        label = nama_kecamatan,
        vjust = -0.6
      ),
      family = "Manjari",
      color = "gray15",
      size = 3.5
    ) +
    labs(
      title = judul,
      subtitle = subjudul,
      x = "Rerata Nilai Ujian",
      y = NULL,
      caption = "Open Data Kota Bandung (data.bandung.go.id)"
    ) +
    scale_colour_manual(values = c("Meningkat" = "#37DC94", "Menurun" = "#FA5C65"), drop = FALSE) +
    theme(
        legend.background = element_blank(),
        legend.key = element_blank(),
        legend.title = element_blank(),
        legend.position = "bottom"
    )
    # theme(
    #   # panel.background = element_rect(fill = "lightgrey"),
    #   # plot.background = element_rect(fill = "lightgrey"),
    #   # legend.background = element_rect(fill = "lightgrey"),
    #   panel.background = element_blank(),
    #   plot.background = element_blank(),
    #   legend.background = element_blank(),
    #   legend.key = element_blank(),
    #   legend.title = element_blank(),
    #   legend.position = "bottom",
    #   axis.ticks = element_blank(),
    #   axis.title = element_blank(),
    #   axis.text = element_blank(),
    #   panel.grid = element_blank(),
    #   plot.title = element_text(
    #     family = "Manjari",
    #     size = 19
    #   ),
    #   plot.subtitle = element_text(
    #     family = "Manjari",
    #     size = 15
    #   ),
    #   plot.caption = element_text(
    #     family = "Manjari",
    #     size = 9
    #   ),
    #   legend.text = element_text(
    #     family = "Manjari",
    #     size = 9
    #   )
    # )
}
