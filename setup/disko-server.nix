# this is a disko setup config to create my partitions with btrfs
{
    disko.devices = { # ----------------------------------------------------> holds the overall categories (disk, mdadm, lvm_vg[>
        disk = { # ---------------------------------------------------------> all disks installed in the system like SSDs, HHDs,>
            main = { # -----------------------------------------------------> disk installed in a NVM Express port (name freely >
                type = "disk"; # -------------------------------------------> marks "nvme0n1" as a disk
                device = "/dev/sda"; # -----------------------------> path to the defined disk
                content = { # ----------------------------------------------> contains everything that should happen on this disk
                    type = "gpt"; # ----------------------------------------> partitioning style (GUID Partition Table [gpt] or >
                    partitions = { # ---------------------------------------> partitions created on this disk

                        # EFI partition
                        ESP = { # ------------------------------------------> define EFI partition (name freely selectable)
                            size = "512M"; # -------------------------------> absolute size for this partition
                            type = "EF00"; # -------------------------------> type of the partition "ef00" marks it as efi parti>
                            content = { # ----------------------------------> contains everything that should happen on this par>
                                type = "filesystem"; # ---------------------> role for this partition
                                format = "vfat"; # -------------------------> fromat as this filesystem
                                mountpoint = "/boot"; # --------------------> mounted here
                                mountOptions = [ "umask=0077" ]; # ---------> options for mounting
                            };
                        };

                        # root
                        root = { # -----------------------------------------> define luks partition (name freely selectable)
                            size = "100%"; # -------------------------------> takes all of the remaining space of this disk for >
                            content = { # ------------------------------> contains everything that should happen on this partiti>
                                type = "btrfs"; # ----------------------> role for this partition
                                extraArgs = [ "-f" ]; # ----------------> btrfs args
                                subvolumes = { # -----------------------> btrfs subvolumes

                                    # root subvolume
                                    "/root" = { # ----------------------> root subvolume
                                        mountpoint = "/"; # ------------> subvolume mountpoint
                                        mountOptions = [ # -------------> mounting options
                                            "compress=zstd" # ----------> compress option
                                            "noatime" # ----------------> ???
                                        ];
                                    };

                                    # home subvolume
                                    "/home" = { # ----------------------> home subvolume
                                        mountpoint = "/home"; # --------> subvolume mountpoint
                                        mountOptions = [ # -------------> mounting options
                                            "compress=zstd" # ----------> compress option
                                            "noatime" # ----------------> ???
                                        ];
                                    };

                                    # nix subvolume
                                    "/nix" = { # -----------------------> nix subvolume
                                        mountpoint = "/nix"; # ---------> subvolume mountpoint
                                        mountOptions = [ # -------------> mounting options
                                            "compress=zstd" # ----------> compress option
                                            "noatime" # ----------------> ???
                                        ];
                                    };

                                    # swap subvolume
                                    "/swap" = { # ----------------------> swap subvolume
                                        mountpoint = "/.swapvol"; # ----> subvolume mountpoint
                                        swap.swapfile.size = "16G"; # --> absolute size for the swap file
                                    };
                                };
                            };
                        };
                    };
                };
            };
        };
    };
}